#!/bin/bash
if [ -z "${ES_URL}" ]
  ES_URL="localhost:9200"
fi
if [ -z "$1" ]
then
  echo "$0: please provide index name as an argument"
  exit 1
fi
curl --head "${ES_URL}/${1}" | grep '404 Not Found' && ./es/create_es_index.sh "${1}"
exit 0
