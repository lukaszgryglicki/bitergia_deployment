#!/bin/bash
if [ -z "$1" ]
then
  echo "$0: please provide from index name as a first argument"
  exit 1
fi
if [ -z "$2" ]
then
  echo "$0: please provide to index name as a second argument"
  exit 2
fi
curl -XPOST -H 'Content-Type: application/json' "localhost:9200/_reindex?refresh" -d "{\"source\":{\"index\":\"${1}\"},\"dest\":{\"index\":\"${2}\"}}"
