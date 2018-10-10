#!/bin/bash
if [ -z "${API_KEY}" ]
then
  echo "$0: you need to set API_KEY=... to be able to use GitHub API calls"
  exit 1
fi
p2o.py --enrich --index onos_github_raw --index-enrich onos_github -e http://localhost:9200 --no_inc --debug github opennetworkinglab onos -t "${API_KEY}"
