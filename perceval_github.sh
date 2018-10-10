#!/bin/bash
if [ -z "${API_KEY}" ]
then
  echo "$0: you need to set API_KEY=... to be able to use GitHub API calls"
  exit 1
fi
perceval github opennetworkinglab onos -t "${API_KEY}" > perceval_opennetworkinglab_onos.github.log
