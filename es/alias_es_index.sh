#!/bin/bash
if [ -z "${ES_URL}" ]
then
  ES_URL="localhost:9200"
fi
if [ -z "$1" ]
then
  echo "$0: please provide from index name as a first argument"
  exit 1
fi
if [ -z "$2" ]
then
  echo "$0: please provide to alias name as a second argument"
  exit 2
fi
curl -XPUT "${ES_URL}/${1}/_alias/${2}"
