#!/bin/bash
if [ -z "${ES_URL}" ]
then
  ES_URL="localhost:9200"
fi
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
curl -XPUT "${ES_URL}/${1}"
echo "${1}/${TYPE}"
curl -XPOST -H 'Content-Type: application/json' "${ES_URL}/${1}/${TYPE}?refresh=wait_for" -d '{}'
