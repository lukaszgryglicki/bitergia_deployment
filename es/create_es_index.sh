#!/bin/bash
if [ -z "$1" ]
then
  echo "$0: please provide index name as an argument"
  exit 1
fi
TYPE=items
base=${1:0:7}
if [ "${base}" = '.kibana' ]
then
  TYPE=doc
fi
curl -XPUT "localhost:9200/${1}"
echo "${1}/${TYPE}"
curl -XPOST -H 'Content-Type: application/json' "localhost:9200/${1}/${TYPE}?refresh=wait_for" -d '{}'
