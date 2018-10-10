#!/bin/bash
p2o.py --enrich --index onos_git_raw --index-enrich onos_git -e http://localhost:9200 --no_inc --debug git https://github.com/opennetworkinglab/onos.git --git-path opennetworkinglab_onos.git > elk_opennetworkinglab_git.gerrit.log
