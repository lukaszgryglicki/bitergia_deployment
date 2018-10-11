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

func importAffs(db *sql.DB, users *gitHubUsers) {
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

	// Process all JSON entries
	hits := 0
	for _, user := range *users {
		// Email decode ! --> @
		user.Email = strings.ToLower(emailDecode(user.Email))
		email := user.Email
		login := user.Login
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
			fmt.Printf("%s/%s: %+v\n", login, email, uuids)
			hits++
		}
	}
	fmt.Printf("Hits: %d\n", hits)
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
