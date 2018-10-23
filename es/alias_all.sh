#!/bin/bash
if [ -z "${ES_URL}" ]
  ES_URL="localhost:9200"
fi
if [ -z "$ONLY" ]
then
  ONLY=`cat ./indexes.txt`
fi
INDEXES=${ONLY} ./es/make_aliases.sh
