#!/bin/bash
if [ -z "${PASS}" ]
then
  echo "$0: you need to specify shdb password via: PASS=... $*"
  exit 1
fi
sortinghat -d shdb -u shuser -p "${PASS}" unify
