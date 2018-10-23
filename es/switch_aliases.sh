#!/bin/sh
if [ -z "${ES_URL}" ]
  ES_URL="localhost:9200"
fi
if [ -z "${INDEXES}" ]
then
  echo "$0: please provide indexes to alias via INDEXES='ind1 ind2 ... indN'"
  exit 1
fi
if [ -z "${FROM_VERSION}" ]
then
  echo "$0: please provide the from version suffix for indexes via FROM_VERSION='_v1'"
  exit 2
fi
if [ -z "${TO_VERSION}" ]
then
  echo "$0: please provide the to version suffix for indexes via TO_VERSION='_v1'"
  exit 3
fi
for index in ${INDEXES}
do
  indexvf="${index}${FROM_VERSION}"
  indexvt="${index}${TO_VERSION}"
  echo "\nCreating index ${indexvt} if not exists"
  ./es/create_es_index_if_not_exists.sh "${indexvt}" || exit 4
  echo "\nDropping alias index ${indexvf}, alias ${index}"
  ./es/delete_es_alias.sh "${indexvf}" "${index}" || exit 5
  echo "\nAliasing index ${indexvt} --> alias ${index}"
  ./es/alias_es_index.sh "${indexvt}" "${index}" || exit 6
done
echo "\nDisplay indexes"
es/get_es_indexes.sh || exit 7
echo "\nDisplay aliases"
es/get_es_aliases.sh || exit 8
echo 'Done'
