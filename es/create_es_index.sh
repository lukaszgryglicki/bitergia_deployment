#!/bin/bash
if [ -z "$1" ]
then
  echo "$0: please provide index name as an argument"
  exit 1
fi
curl -XPUT "localhost:9200/${1}"
curl -XPOST -H 'Content-Type: application/json' "localhost:9200/${1}/items?refresh=wait_for" -d '{}'
