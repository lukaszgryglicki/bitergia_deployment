#!/bin/bash
if [ -z "$1" ]
then
  echo "$0: please provide index name as an argument"
  exit 1
fi
curl --head "localhost:9200/${1}" | grep '404 Not Found' && ./es/create_es_index.sh "${1}"
exit 0
