#!/bin/bash
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
  exit 3
fi
curl -XPOST -H 'Content-Type: application/json' "localhost:9200/${1}/${2}/_search?pretty" -d "$3"
