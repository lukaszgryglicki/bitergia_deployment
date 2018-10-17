#!/bin/bash
if [ -z "${PASS}" ]
then
  echo -n "SortingHat DB Password: "
  read -s PASS
fi
if [ -z "${IDENTITIES}" ]
then
  p2o.py --enrich --index git_raw --index-enrich git -e http://localhost:9200 --no_inc --debug --db-host localhost --db-sortinghat shdb --db-user shuser --db-password "${PASS}" git https://github.com/opennetworkinglab/onos.git --git-path opennetworkinglab_onos.git
else
  echo "Only identities mode"
  p2o.py --only-enrich --refresh-identities --index git_raw --index-enrich git -e http://localhost:9200 --no_inc --debug --db-host localhost --db-sortinghat shdb --db-user shuser --db-password "${PASS}" git https://github.com/opennetworkinglab/onos.git --git-path opennetworkinglab_onos.git
fi
