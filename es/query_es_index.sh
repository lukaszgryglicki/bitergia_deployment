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
  echo '{"query":{"query_string":{"query":"type:tvars AND vname:full_name"}}}'
  echo '{"query":{"query_string":{"query":"type:trepo_groups AND repo_group_name:\"cncf/devstats\""}}}'
  echo '{"query":{"query_string":{"query":"type:sactivity_repo_groups AND period:y"}}}'
  echo '{"query":{"query_string":{"query":"type:itvars AND iname:vvalue AND tag_time:\"2014-01-01 13:00:00\""}}}'
  echo '{"query":{"query_string":{"query":"type:sactivity_repo_groups AND data.ivalue:0.14"}}}'
  exit 3
fi
curl -XPOST -H 'Content-Type: application/json' "${ES_URL}/${1}/${2}/_search?pretty" -d "$3"
