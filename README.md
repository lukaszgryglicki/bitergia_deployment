# Installing stack

# Installation

- `apt install python3-pip`.
- `pip3 install grimoirelab`.
- `grimoirelab -v`.
- `wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -`.
- `sudo apt-get install apt-transport-https`.
- `echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-6.x.list`.
- `sudo apt-get update && sudo apt-get install elasticsearch`.
- `service elasticsearch start`.
- `service elasticsearch status`.
- `curl -X GET "localhost:9200/"`.
- `npm install elasticdump -g`
- `cd /some/path`.
- `wget https://github.com/chaoss/grimoirelab-kibiter/releases/download/kibiter-v6.1.0-5/kibiter-6.1.0-5-linux-x86_64.tar.gz`.
- `tar zxf kibiter-6.1.0-5-linux-x86_64.tar.gz`.
- `mv kibiter-6.1.0-5-linux-x86_64 kibiter`.
- `rm kibiter-6.1.0-5-linux-x86_64.tar.gz`.
- `/some/path/kibiter/bin/kibana &`.
- `sudo apt-get install mariadb-server mariadb-client`.
- `sudo apt-get install apparmor-utils`.
- `sudo aa-disable /usr/sbin/mysqld`.
- `sudo aa-remove-unknown`.
- `sudo service apparmor reload`.
- `sudo service mariadb start`
- `sudo service mariadb status`
- `sudo mysql_secure_installation`.
- `mariadb -uroot -pXXX`.
- `sudo apt install redis-server`.
- `sudo service redis status`.
- `redis-cli`. Try `ping`, `quit`.
- `cd $GOPATH/src/`.
- `git clone https://github.com/lukaszgryglicki/bitergia_deployment.git`.
- `cd bitergia_deployment`.
- `go get -u github.com/go-sql-driver/mysql`.
- `make`.
- `PASS=XXX ./sortinghat/create_shuser.sh`.
- `PASS=XXX ./sortinghat/init_sortinghat.sh`.
- `mkdir arthurd_logs; ./arthurd.sh`.

# Tools

# Run backends manually with Perceval

This only runs backends and stores results in `*.log` files.

- For testing git data source, the script contains full list of repos to process: `./perceval/perceval_git.sh`.
- For testing GitHub data source, script contains full list of repos to process (`API_KEY` is a [GitHub OAuth key](https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line/)): `` API_KEY=`cat /etc/github/oauth` ./perceval/perceval_github.sh ``.
- For testing Gerrit data source, script contains Gerrit URL (`GERRIT_USER` is a Gerrit username who has [SSH access configured and public keys imported](https://www.tutorialspoint.com/gerrit/gerrit_generate_new_ssh_key.htm) etc.): `GERRIT_USER=username ./perceval/perceval_gerrit.sh`.
- For testing Mail archives data source see `TODO.md`.
- For testing Slack data source, script contains Slack channel IDs (`API_TOKEN` is a [Legacy Slack token](https://api.slack.com/custom-integrations/legacy-tokens), you need to have access to a project specific Slack workspace): `` API_TOKEN=`cat /etc/slack/onos-token` ./perceval/perceval_slack.sh ``.
- For testing Jira data source, script contains Jira URL (`JIRA_USER` and `JIRA_PWD` are your Jira credentials): `JIRA_USER=username JIRA_PWD=XXX ./perceval/perceval_jira.sh`.
- For testing Confluence data source, Script contains confluence URL: `./perceval/perceval_confluence.sh`.

# Run ELK tasks

First, create aliases for indexes to use:

- `VERSION='_v1' ./es/alias_all.sh`.

This saves data into ES indices and into SortingHat database. All details about URLs, usernames and possible API tokens are the same as por Perceval jobs:

- Git: `PASS=XXX ./elk/elk_git.sh`.
- GitHub: `` API_KEY=`cat /etc/github/oauth` PASS=XXX ./elk/elk_github.sh ``.
- Gerrit: `GERRIT_USER=username PASS=XXX ./elk/elk_gerrit.sh`.
- Mail: see `TODO.md`.
- Slack: `` API_TOKEN=`cat /etc/slack/onos-token` PASS=XXX ./elk/elk_slack.sh ``.
- Jira: `JIRA_USER=username JIRA_PWD=XXX PASS=XXX ./elk/elk_jira.sh`.
- Confluence: `PASS=XXX ./elk/elk_confluence.sh`.
- Use any of `es/get_es_`... script to get informations about indexes/types created.

# Enchance SortingHat DB

Once you have all the data, enchance SortingHat DB.

- Run SortingHat automatic enrichments: `` GENDERIZE_TOKEN=`cat /etc/genderize.io/key` PASS=XXX ./sortinghat/sortinghat_workflow.sh ``
- Import `github_users.json` from `cncf/devstats`: `PASS=XXX ./json2hat`.

# Running Kibiter

- `KIBITER_PATH=/some/path/kibiter/bin/kibana ./kibiter.sh &`.

# Manage ElacticSearch aliases

By default we use aliases for all indexes, for example `git`, `github` etc. They point to `git_v1`, `github_v1` by default.
Aliases were creaed by `VERSION='_v1' ./es/alias_all.sh`, command `_v1` is a real index suffix.

- You can switch to `_v2` indexes via: `FROM_VERSION='_v1' TO_VERSION='_v2' ./es/switch_all.sh`, so now `git` will point to `git_v2`.
- Then you can switch back to `_v1` via: `FROM_VERSION='_v2' TO_VERSION='_v1' ./es/switch_all.sh`.
- If you generated all data without index aliases, you can `reindex` data using `elasticdump` to point to `_v1` for example: `REINDEX=1 VERSION='_v1' ./es/alias_all.sh`. It will keep all data nad metadata.
- You cna drop `_v2` version via: `VERSION='_v2' es/drop_all.sh`.

This is all useful when you want to generate data from ELK first and then switch to v2 to see how SirMordred worked, to do so:

- `VERSION='_v1' ./es/alias_all.sh`.
- Generate data using ELK.
- See that data in Kibiter.
- `FROM_VERSION='_v1' TO_VERSION='_v2' ./es/switch_all.sh`.
- Generate data using SirMordred/
- See that data in Kibiter.
- Then possibly switch between v1 and v2 as you like.
