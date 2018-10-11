#!/bin/bash
if [ -z "${PASS}" ]
then
  echo "$0: you need to specify shdb password via: PASS=... $*"
  exit 1
fi
if [ -z "${FIELD}" ]
then
  echo "$0: you need to specify merge field via: FIELD=... $*"
  exit 2
fi
for uuids in `mysql -u shuser -p -s shdb -e "select inn.str from (select ${FIELD}, count(distinct uuid) as cnt, group_concat(distinct uuid) as str from identities where ${FIELD} is not null and ${FIELD} != '' group by ${FIELD} having cnt > 1) inn"`
do
  suuids="${uuids//,/ }"
  first=""
  echo "Identical by ${FIELD}: $suuids"
  for uuid in $suuids
  do
    if [ "$first" = "" ]
    then
      first=$uuid
    else
      echo "Merge $uuid into $first"
      sortinghat -u shuser -p "${PASS}" -d shdb merge $uuid $first
    fi
  done
done
