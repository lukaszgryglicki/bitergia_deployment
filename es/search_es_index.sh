#!/bin/bash
if [ -z "${ES_URL}" ]
then
  ES_URL="localhost:9200"
fi
if [ -z "$1" ]
then
  echo "$0: please provide index name as a first argument"
  exit 1
fi
if [ -z "$2" ]
then
  echo "$0: please provide type name as a second argument"
  exit 2
fi
if [ -z "$3" ]
then
  echo "$0: please provide search query as a third argument:"
  echo '{"query":{"match":{"type":"tquick_ranges"}}}'
  echo '{"query":{"match":{"type":"sannotations"}}}'
  echo '{"query":{"match":{"type":"tcountries"}}}'
  echo '{"query":{"match":{"type":"sevents_h"}}}'
  echo '{"query":{"match":{"type":"sact"}}}'
  echo '{"query":{"match":{"type":"sactivity_repo_groups"}}}'
  echo '{"query":{"match":{"period":"q"}}}'
  echo '{"query":{"match":{"type":"svars"}}}'
  exit 3
fi
curl -XPOST -H 'Content-Type: application/json' "${ES_URL}/${1}/${2}/_search?pretty" -d "$3"
