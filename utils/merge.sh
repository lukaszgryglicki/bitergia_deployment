#!/bin/bash
if [ -z "${PASS}" ]
then
  echo "$0: you need to specify shdb password via: PASS=... $*"
  exit 1
fi
FIELD=email ./merge_by_field.sh
FIELD=username ./merge_by_field.sh
