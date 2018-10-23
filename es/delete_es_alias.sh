#!/bin/bash
if [ -z "${ES_URL}" ]
  ES_URL="localhost:9200"
fi
if [ -z "$1" ]
then
  echo "$0: please provide index name as a first argument"
  exit 1
fi
if [ -z "$2" ]
then
  echo "$0: please provide alias name as a second argument"
  exit 2
fi
curl -XDELETE "${ES_URL}/${1}/_alias/${2}"
