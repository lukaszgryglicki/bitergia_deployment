#!/bin/bash
if [ -z "$1" ]
then
  echo "$0: please provide index name as an argument"
  exit 1
fi
curl -XDELETE "http://localhost:9200/${1}"
