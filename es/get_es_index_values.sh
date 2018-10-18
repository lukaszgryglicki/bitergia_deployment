#!/bin/bash
if [ -z "$1" ]
then
  echo "$0: please provide index name as a first argument"
  exit 1
fi
curl -XGET "localhost:9200/${1}/_search?pretty"
