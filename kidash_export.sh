#!/bin/bash
if [ -z "$1" ]
then
  echo "$0: you need to provide dashboard name as an argument"
  exit 1
fi
kidash -e http://localhost:9200 --dashboard "$1" --export "dashboards/$1.json"
