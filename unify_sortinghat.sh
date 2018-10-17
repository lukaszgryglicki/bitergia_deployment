#!/bin/bash
if [ -z "${PASS}" ]
then
  echo -n "SortingHat DB Password: "
  read -s PASS
fi
sortinghat -d shdb -u shuser -p "${PASS}" unify -m email
sortinghat -d shdb -u shuser -p "${PASS}" unify -m username
