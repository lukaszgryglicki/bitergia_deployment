#!/bin/bash
if [ -z "${PASS}" ]
then
  echo -n "SortingHat DB Password: "
  read -s PASS
fi
if [ -z "${GENDERIZE_TOKEN}" ]
then
  echo -n "Genderize.io API token: "
  read -s GENDERIZE_TOKEN
fi
sortinghat -d shdb -u shuser -p "${PASS}" autogender --api-token="${GENDERIZE_TOKEN}"
