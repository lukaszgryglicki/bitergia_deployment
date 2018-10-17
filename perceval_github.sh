#!/bin/bash
if [ -z "${API_KEY}" ]
then
  echo -n "GitHub API key: "
  read -s API_KEY
fi
perceval github opennetworkinglab onos --category issue -t "${API_KEY}" --sleep-for-rate > perceval_opennetworkinglab_onos.github.log
perceval github opennetworkinglab onos --category pull_request -t "${API_KEY}" --sleep-for-rate >> perceval_opennetworkinglab_onos.github.log
