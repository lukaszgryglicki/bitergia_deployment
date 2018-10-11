#!/bin/bash
if [ -z "${PASS}" ]
then
  echo "$0: you need to specify shdb password via: PASS=... $*"
  exit 1
fi
for uuids in `mysql -u shuser -p -s shdb -e "select inn.str from (select email, count(distinct uuid) as cnt, group_concat(distinct uuid) as str from identities where email is not null and email != '' group by email having cnt > 1) inn"`
do
  suuids="${uuids//,/ }"
  first=""
  echo "Identical $suuids"
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
