#!/bin/bash
# NODATA=1 (skip copying data)
# NOMETA=1 (skip copying metadata)
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
# CURL version was not copying mappings and settings
# curl -XPOST -H 'Content-Type: application/json' "localhost:9200/_reindex?refresh" -d "{\"source\":{\"index\":\"${1}\"},\"dest\":{\"index\":\"${2}\"}}"
# echo 'Reindex alias'
#elasticdump --input "http://localhost:9200/${1}" --output "http://localhost:9200/${2}" --type=alias
if [ -z "${NOMETA}" ]
then
  echo 'Reindex mapping'
  elasticdump --input "http://localhost:9200/${1}" --output "http://localhost:9200/${2}" --type=mapping
  echo 'Reindex settings'
  elasticdump --input "http://localhost:9200/${1}" --output "http://localhost:9200/${2}" --type=settings
  # echo 'Reindex analyzer'
  # elasticdump --input "http://localhost:9200/${1}" --output "http://localhost:9200/${2}" --type=analyzer
fi
if [ -z "${NODATA}" ]
then
  echo 'Reindex data'
  elasticdump --input "http://localhost:9200/${1}" --output "http://localhost:9200/${2}" --type=data
fi
