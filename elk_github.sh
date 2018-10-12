#!/bin/bash
if [ -z "${API_KEY}" ]
then
  echo "$0: you need to set API_KEY=... to be able to use GitHub API calls"
  exit 1
fi
if [ -z "${PASS}" ]
then
  echo "$0: you need to specify shdb password via: PASS=... $*"
  exit 2
fi
if [ -z "${IDENTITIES}" ]
then
  p2o.py --enrich --index onos2_github_raw --index-enrich onos2_github -e http://localhost:9200 --no_inc --debug --db-host localhost --db-sortinghat shdb --db-user shuser --db-password "${PASS}" github opennetworkinglab onos -t "${API_KEY}"
else
  echo "Only identities mode"
  p2o.py --only-enrich --refresh-identities --index onos2_github_raw --index-enrich onos2_github -e http://localhost:9200 --no_inc --debug --db-host localhost --db-sortinghat shdb --db-user shuser --db-password "${PASS}" github opennetworkinglab onos -t "${API_KEY}"
fi
