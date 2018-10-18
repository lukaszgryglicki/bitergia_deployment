#!/bin/sh
if [ -z "${INDEXES}" ]
then
  echo "$0: please provide indexes to drop via INDEXES='ind1 ind2 ... indN'"
  exit 1
fi
if [ -z "${VERSION}" ]
then
  echo "$0: please provide the version suffix for indexes via VERSION='_v1'"
  exit 2
fi
for index in ${INDEXES}
do
  indexv="${index}${VERSION}"
  echo "\nDropping alias index ${indexv}, alias ${index}"
  ./es/delete_es_alias.sh "${indexv}" "${index}" || exit 3
  echo "\nDeleting index ${indexv}"
  ./es/delete_es_index.sh "${indexv}" || exit 4
done
echo "\nDisplay indexes"
es/get_es_indexes.sh || exit 5
echo "\nDisplay aliases"
es/get_es_aliases.sh || exit 6
echo 'Done'
