#!/bin/bash
if [ -z "${GERRIT_USER}" ]
then
  echo "$0: you need to set GERRIT_USER=... to be able to use Gerrit (and that user must have SSH access configured)"
  exit 1
fi
perceval gerrit --category review --user "${GERRIT_USER}" gerrit.onosproject.org > perceval_opennetworkinglab_onos.gerrit.log
