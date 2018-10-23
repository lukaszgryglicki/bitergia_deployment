#!/bin/sh
# REINDEX=1 (reindex existing data - use when you have no aliases and indexes use the names that should be aliases)
if [ -z "${ES_URL}" ]
  ES_URL="localhost:9200"
fi
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
  if [ -z "${REINDEX}" ]
  then
    echo "\nCreating index ${indexv} if not exists"
    ./es/create_es_index_if_not_exists.sh "${indexv}" || exit 3
    echo "\nAliasing index ${indexv} --> alias ${index}"
    ./es/alias_es_index.sh "${indexv}" "${index}" || exit 4
  else
    echo "\nCreating index ${index} if not exists"
    ./es/create_es_index_if_not_exists.sh "${index}" || exit 5
    echo "\nReindexing index ${index} --> index ${indexv}"
    ./es/es_reindex.sh "${index}" "${indexv}" || exit 6
    echo "\nDeleting index ${index}"
    ./es/delete_es_index.sh "${index}" || exit 7
    echo "\nAliasing index ${indexv} --> alias ${index}"
    ./es/alias_es_index.sh "${indexv}" "${index}" || exit 8
  fi
done
echo "\nDisplay indexes"
es/get_es_indexes.sh || exit 9
echo "\nDisplay aliases"
es/get_es_aliases.sh || exit 10
echo 'Done'
