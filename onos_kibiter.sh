#!/bin/bash
if [ -z "$KIBITER_PATH" ]
then
  echo "$0: usage: KIBITER_PATH=... $*"
  exit 1
fi
arch=`uname -m`
if [ "$arch" = "aarch64" ]
then
  echo "$0: this cannot be run on adm64, run it on adm64"
  exit 2
fi
"${KIBITER_PATH}/bin/kibana" -e http://147.75.97.234:9200 -H 0.0.0.0 || exit 3
