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
  echo "$0: please provide file name as a second argument (only root filename, like: git)"
  exit 2
fi
if [ -z "${NOMETA}" ]
then
  elasticdump --input "http://localhost:9200/${1}" --output "${2}.alias.json" --type=alias
  elasticdump --input "http://localhost:9200/${1}" --output "${2}.mapping.json" --type=mapping
  elasticdump --input "http://localhost:9200/${1}" --output "${2}.settings.json" --type=settings
  elasticdump --input "http://localhost:9200/${1}" --output "${2}.analyzer.json" --type=analyzer
fi
if [ -z "${NODATA}" ]
then
  elasticdump --input "http://localhost:9200/${1}" --output "${2}.data.json" --type=data
fi