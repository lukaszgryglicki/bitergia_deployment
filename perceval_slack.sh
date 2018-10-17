#!/bin/bash
if [ -z "${API_TOKEN}" ]
then
  echo "$0: you need to set API_TOKEN=... to be able to use Slack API calls"
  exit 1
fi
# random channel
perceval slack C095YQBM2 --category message -t "${API_TOKEN}" >> onosproject.slack.com.log
# general channel
perceval slack C095YQBLL --category message -t "${API_TOKEN}" > onosproject.slack.com.log
