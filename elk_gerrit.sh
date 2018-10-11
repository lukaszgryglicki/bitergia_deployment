#!/bin/bash
if [ -z "${PASS}" ]
then
  echo "$0: you need to specify shdb password via: PASS=... $*"
  exit 1
fi
p2o.py --enrich --index onos_gerrit_raw --index-enrich onos_gerrit -e http://localhost:9200 --no_inc --debug --db-host localhost --db-sortinghat shdb --db-user shuser --db-password "${PASS}" gerrit --user lukaszgryglicki gerrit.onosproject.org
