package main

import (
	"database/sql"
	"encoding/json"
	"fmt"
	"io/ioutil"
	"os"
	"regexp"
	"runtime/debug"
	"strings"
	"time"

	_ "github.com/go-sql-driver/mysql"
)

// gitHubUsers - list of GitHub user data from cncf/gitdm.
type gitHubUsers []gitHubUser

// gitHubUser - single GitHug user entry from cncf/gitdm `github_users.json` JSON.
type gitHubUser struct {
	Login       string   `json:"login"`
	Email       string   `json:"email"`
	Affiliation string   `json:"affiliation"`
	Name        string   `json:"name"`
	CountryID   *string  `json:"country_id"`
	Sex         *string  `json:"sex"`
	Tz          *string  `json:"tz"`
	SexProb     *float64 `json:"sex_prob"`
}

// affData - holds single affiliation data
type affData struct {
	uuid    string
	company string
	from    time.Time
	to      time.Time
}

// stringSet - set of strings
type stringSet map[string]struct{}

func fatalOnError(err error) {
	if err != nil {
		tm := time.Now()
		fmt.Printf("Error(time=%+v):\nError: '%s'\nStacktrace:\n%s\n", tm, err.Error(), string(debug.Stack()))
		fmt.Fprintf(os.Stderr, "Error(time=%+v):\nError: '%s'\nStacktrace:\n", tm, err.Error())
		panic("stacktrace")
	}
}

func fatalf(f string, a ...interface{}) {
	fatalOnError(fmt.Errorf(f, a...))
}

// decode emails with ! instead of @
func emailDecode(line string) string {
	re := regexp.MustCompile(`([^\s!]+)!([^\s!]+)`)
	return re.ReplaceAllString(line, `$1@$2`)
}

func timeParseAny(dtStr string) time.Time {
	formats := []string{
		"2006-01-02 15:04:05",
		"2006-01-02 15:04",
		"2006-01-02 15",
		"2006-01-02",
		"2006-01",
		"2006",
	}
	for _, format := range formats {
		t, e := time.Parse(format, dtStr)
		if e == nil {
			return t
		}
	}
	fatalf("Error:\nCannot parse date: '%v'\n", dtStr)
	return time.Now()
}

func updateProfile(db *sql.DB, uuid string, user *gitHubUser) {
	var cols []string
	var args []interface{}
	if user.Sex != nil && (*user.Sex == "m" || *user.Sex == "f") {
		gender := "male"
		if *user.Sex == "f" {
			gender = "female"
		}
		cols = append(cols, "gender = ?")
		args = append(args, gender)
	}
	if user.SexProb != nil {
		cols = append(cols, "gender_acc = ?")
		args = append(args, int(*user.SexProb*100.0))
	}
	if user.CountryID != nil {
		cols = append(cols, "country_code = ?")
		args = append(args, strings.ToUpper(*user.CountryID))
	}
	if len(cols) > 0 {
		query := strings.Join(cols, ", ")
		query = "update profiles set " + query + " where uuid = ?"
		args = append(args, uuid)
		// fmt.Printf("%s\n", query)
		_, err := db.Exec(query, args...)
		fatalOnError(err)
	}
}

func addOrganization(db *sql.DB, company string) int {
	_, err := db.Exec("insert into organizations(name) values(?)", company)
	fatalOnError(err)
	rows, err := db.Query("select id from organizations where name = ?", company)
	fatalOnError(err)
	var id int
	for rows.Next() {
		fatalOnError(rows.Scan(&id))
	}
	fatalOnError(rows.Err())
	fatalOnError(rows.Close())
	return id
}

func addEnrollment(db *sql.DB, uuid string, companyID int, dtFrom, dtTo time.Time) {
}

func importAffs(db *sql.DB, users *gitHubUsers) {
	// Fetch existing identities
	rows, err := db.Query("select uuid, email, username, source from identities")
	fatalOnError(err)
	var uuid string
	var email string
	var username string
	var pemail *string
	var pusername *string
	var source string
	email2uuid := make(map[string]string)
	username2uuid := make(map[string]string)
	for rows.Next() {
		fatalOnError(rows.Scan(&uuid, &pemail, &pusername, &source))
		email = ""
		username = ""
		if pemail != nil {
			email = *pemail
		}
		if pusername != nil {
			username = *pusername
		}
		email2uuid[email] = uuid
		if source == "git" || source == "github" {
			username2uuid[username] = uuid
		}
	}
	fatalOnError(rows.Err())
	fatalOnError(rows.Close())

	// Fetch current organizations
	rows, err = db.Query("select id, name from organizations")
	fatalOnError(err)
	var name string
	var id int
	oname2id := make(map[string]int)
	for rows.Next() {
		fatalOnError(rows.Scan(&id, &name))
		oname2id[name] = id
	}
	fatalOnError(rows.Err())
	fatalOnError(rows.Close())

	// Process all JSON entries
	defaultStartDate := time.Date(1970, 1, 1, 0, 0, 0, 0, time.UTC)
	defaultEndDate := time.Date(2099, 1, 1, 0, 0, 0, 0, time.UTC)
	companies := make(stringSet)
	var affList []affData
	hits := 0
	allAffs := 0
	for _, user := range *users {
		// Email decode ! --> @
		user.Email = strings.ToLower(emailDecode(user.Email))
		email := user.Email
		login := user.Login
		// Update profiles
		uuids := make(map[string]struct{})
		uuid, ok := email2uuid[email]
		if ok {
			uuids[uuid] = struct{}{}
		}
		uuid, ok = username2uuid[login]
		if ok {
			uuids[uuid] = struct{}{}
		}
		if len(uuids) > 0 {
			for uuid := range uuids {
				updateProfile(db, uuid, &user)
			}
			hits++
			// Affiliations
			affs := user.Affiliation
			if affs == "NotFound" || affs == "(Unknown)" || affs == "?" || affs == "" {
				continue
			}
			affsAry := strings.Split(affs, ", ")
			prevDate := defaultStartDate
			for _, aff := range affsAry {
				var dtFrom, dtTo time.Time
				ary := strings.Split(aff, " < ")
				company := strings.TrimSpace(ary[0])
				if len(ary) > 1 {
					// "company < date" form
					dtFrom = prevDate
					dtTo = timeParseAny(ary[1])
				} else {
					// "company" form
					dtFrom = prevDate
					dtTo = defaultEndDate
				}
				if company == "" {
					continue
				}
				companies[company] = struct{}{}
				for uuid := range uuids {
					affList = append(affList, affData{uuid: uuid, company: company, from: dtFrom, to: dtTo})
					allAffs++
				}
				prevDate = dtTo
			}
		}
	}
	// fmt.Printf("affList: %+v\ncompanies: %+v\n", affList, companies)

	// Add companies
	for company := range companies {
		if company == "" {
			continue
		}
		id, ok := oname2id[company]
		if !ok {
			id = addOrganization(db, company)
			oname2id[company] = id
		}
	}

	// Add enrollments
	for _, aff := range affList {
		uuid := aff.uuid
		if aff.company == "" {
			continue
		}
		companyID, ok := oname2id[aff.company]
		if !ok {
			fatalf("company not found: " + aff.company)
		}
		addEnrollment(db, uuid, companyID, aff.from, aff.to)
	}
	fmt.Printf("Hits: %d, affiliations: %d, companies: %d\n", hits, allAffs, len(companies))
}

func main() {
	// Connect to MariaDB
	pass := os.Getenv("PASS")
	if pass == "" {
		fatalf("please specify database password via PASS=...")
	}
	db, err := sql.Open("mysql", "shuser:"+os.Getenv("PASS")+"@/shdb?charset=utf8")
	fatalOnError(err)
	defer func() { fatalOnError(db.Close()) }()

	// Parse github_users.json
	var users gitHubUsers
	data, err := ioutil.ReadFile("./github_users.json")
	fatalOnError(err)
	fatalOnError(json.Unmarshal(data, &users))

	// Import affiliations
	importAffs(db, &users)
}
