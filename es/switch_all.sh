#!/bin/bash
if [ -z "$ONLY" ]
then
  ONLY=`cat ./indexes.txt`
fi
INDEXES=${ONLY} ./es/switch_aliases.sh
