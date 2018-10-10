#!/bin/bash
p2o.py --enrich --index onos_gerrit_raw --index-enrich onos_gerrit -e http://localhost:9200 --no_inc --debug gerrit --user lukaszgryglicki gerrit.onosproject.org
