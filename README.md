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
- `PASS=XXX ./create_shuser.sh`.
- `PASS=XXX ./init_sortinghat.sh`.
- `mkdir arthurd_logs; ./arthurd.sh`.

# Tools

# Run backends manually with Perceval

This only runs backends and stores results in `*.log` files.

- For testing git data source: `./perceval_git.sh`.
- For testing GitHub data source (`API_KEY` is a GitHub OAuth key): `` API_KEY=`cat /etc/github/oauth` ./perceval_github.sh ``.
- For testing Gerrit data source (`GERRIT_USER` is a Gerrit username who has SSH access configured, [public keys imported](https://www.tutorialspoint.com/gerrit/gerrit_generate_new_ssh_key.htm) etc.): `GERRIT_USER=username ./perceval_gerrit.sh`.
- For testing Mail archives data source see `TODO.md`.
- For testing Slack data source (`API_TOKEN` is a [Legacy Slack token](https://api.slack.com/custom-integrations/legacy-tokens)): `` API_TOKEN=`cat /etc/slack/onos-token` ./perceval_slack.sh ``.
- For testing Jira data source: `JIRA_USER=username JIRA_PWD=XXX ./perceval_jira.sh`.
- For testing Confluence data source: `./perceval_confluence.sh`.

# Run ELK tasks

This saves data into ES indices and into SOrtingHat database:

- Git: `PASS=XXX ./elk_git.sh`.
- GitHub: `` API_KEY=`cat /etc/github/oauth` PASS=XXX ./elk_github.sh ``.
