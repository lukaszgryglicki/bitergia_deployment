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
# sortinghat orgs -a Example
# sortinghat enroll --from 2014-06-01 --to 2015-09-01 a9b403e150dd4af8953a52a4bb841051e4b705d9 Example
# sortinghat enroll --from 2015-09-01 a9b403e150dd4af8953a52a4bb841051e4b705d9 Individual
unify_sortinghat.sh
autoprofile_sortinghat.sh
autogender_sortinghat.sh
