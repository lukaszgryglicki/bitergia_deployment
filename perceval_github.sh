#!/bin/bash
if [ -z "${API_KEY}" ]
then
  echo "$0: you need to set API_KEY=... to be able to use GitHub API calls"
  exit 1
fi
perceval github opennetworkinglab onos --category issue -t "${API_KEY}" --sleep-for-rate > perceval_opennetworkinglab_onos.github.log
perceval github opennetworkinglab onos --category pull_request -t "${API_KEY}" --sleep-for-rate > perceval_opennetworkinglab_onos.github.log
