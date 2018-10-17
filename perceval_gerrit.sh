#!/bin/bash
if [ -z "${GUSER}" ]
then
  echo "$0: you need to set GUSER=... to be able to use Gerrit (and that user must have SSH access configured)"
  exit 1
fi
perceval gerrit --category review --user "${GUSER}" gerrit.onosproject.org > perceval_opennetworkinglab_onos.gerrit.log
