#!/bin/bash
if [ -z "${ES_URL}" ]
  ES_URL="localhost:9200"
fi
if [ -z "$1" ]
then
  echo "$0: please provide index name as an argument"
  exit 1
fi
curl -XDELETE "${ES_URL}/${1}"
