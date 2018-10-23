#!/bin/bash
if [ -z "${ES_URL}" ]
then
  ES_URL="localhost:9200"
fi
if [ -z "$ONLY" ]
then
  ONLY=`cat ./indexes.txt`
fi
INDEXES=${ONLY} ./es/switch_aliases.sh
