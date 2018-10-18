#!/bin/sh
if [ -z "${INDEXES}" ]
then
  echo "$0: please provide indexes to alias via INDEXES='ind1 ind2 ... indN'"
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
  echo "\nCreating index ${index} if not exists"
  ./es/create_es_index_if_not_exists.sh "${index}" || exit 3
  echo "\nReindexing index ${index} --> index ${indexv}"
  ./es/reindex.sh "${index}" "${indexv}" || exit 4
  echo "\nDeleting index ${index}"
  ./es/delete_es_index.sh "${index}" || exit 5
  echo "\nAliasing index ${indexv} --> alias ${index}"
  ./es/alias_es_index.sh "${indexv}" "${index}" || exit 6
done
echo "\nDisplay indexes"
es/get_es_indexes.sh || exit 7
echo "\nDisplay aliases"
es/get_es_aliases.sh || exit 8
echo 'Done'
