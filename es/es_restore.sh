#!/bin/bash
# NODATA=1 (skip restoring data)
# NOMETA=1 (skip restoring metadata)
if [ -z "$1" ]
then
  echo "$0: please provide from index as a first argument"
  exit 1
fi
if [ -z "$2" ]
then
  echo "$0: please provide file name as a second argument (only root filename, like: git)"
  exit 2
fi
if [ -z "${NOMETA}" ]
then
  elasticdump --output "http://localhost:9200/${1}" --input "${2}.alias.json" --type=alias
  elasticdump --output "http://localhost:9200/${1}" --input "${2}.mapping.json" --type=mapping
  elasticdump --output "http://localhost:9200/${1}" --input "${2}.settings.json" --type=settings
  elasticdump --output "http://localhost:9200/${1}" --input "${2}.analyzer.json" --type=analyzer
fi
if [ -z "${NODATA}" ]
then
  elasticdump --output "http://localhost:9200/${1}" --input "${2}.data.json" --type=data
fi
