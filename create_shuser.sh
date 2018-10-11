#! /bin/bash
if [ -z "${PASS}" ]
then
  echo "$0: you need to specify shdb password via: PASS=... $*"
  exit 1
fi
newUser='shuser'
newDb='shdb'
#host=localhost
host='%'
commands="drop user if exists '${newUser}'@'${host}'; create user '${newUser}'@'${host}' identified by '${PASS}'; grant all on *.* to '${newUser}'@'${host}' identified by '${PASS}'; grant create on *.* to '${newUser}'@'${host}' identified by '${PASS}'; flush privileges;"
echo "${commands}" | /usr/bin/mysql -u root -p
