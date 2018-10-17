#!/bin/bash
if [ -z "${API_KEY}" ]
then
  echo -n "GitHub API key: "
  read -s API_KEY
fi
if [ -z "${PASS}" ]
then
  echo -n "SortingHat DB Password: "
  read -s PASS
fi
if [ -z "${IDENTITIES}" ]
then
  p2o.py --enrich --index github_raw --index-enrich github -e http://localhost:9200 --no_inc --debug --db-host localhost --db-sortinghat shdb --db-user shuser --db-password "${PASS}" github opennetworkinglab onos --category issue -t "${API_KEY}"
  p2o.py --enrich --index github_raw --index-enrich github -e http://localhost:9200 --no_inc --debug --db-host localhost --db-sortinghat shdb --db-user shuser --db-password "${PASS}" github opennetworkinglab onos --category pull_request -t "${API_KEY}"
else
  echo "Only identities mode"
  p2o.py --only-enrich --refresh-identities --index github_raw --index-enrich github -e http://localhost:9200 --no_inc --debug --db-host localhost --db-sortinghat shdb --db-user shuser --db-password "${PASS}" github opennetworkinglab onos --category issue -t "${API_KEY}"
  p2o.py --only-enrich --refresh-identities --index github_raw --index-enrich github -e http://localhost:9200 --no_inc --debug --db-host localhost --db-sortinghat shdb --db-user shuser --db-password "${PASS}" github opennetworkinglab onos --category pull_request -t "${API_KEY}"
fi
