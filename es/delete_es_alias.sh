#!/bin/bash
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
curl -XDELETE "localhost:9200/${1}/_alias/${2}"
