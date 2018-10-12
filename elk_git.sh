#!/bin/bash
if [ -z "${PASS}" ]
then
  echo "$0: you need to specify shdb password via: PASS=... $*"
  exit 1
fi
if [ -z "${IDENTITIES}" ]
then
  p2o.py --enrich --index onos2_git_raw --index-enrich onos2_git -e http://localhost:9200 --no_inc --debug --db-host localhost --db-sortinghat shdb --db-user shuser --db-password "${PASS}" git https://github.com/opennetworkinglab/onos.git --git-path opennetworkinglab_onos.git
else
  echo "Only identities mode"
  p2o.py --only-enrich --refresh-identities --index onos2_git_raw --index-enrich onos2_git -e http://localhost:9200 --no_inc --debug --db-host localhost --db-sortinghat shdb --db-user shuser --db-password "${PASS}" git https://github.com/opennetworkinglab/onos.git --git-path opennetworkinglab_onos.git
fi
