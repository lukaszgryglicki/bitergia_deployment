#!/bin/bash
if [ -z "${PASS}" ]
then
  echo "$0: you need to specify shdb password via: PASS=... $*"
  exit 1
fi
if [ -z "${IDENTITIES}" ]
then
  p2o.py --enrich --index k8s_git_raw --index-enrich k8s_git -e http://localhost:9200 --no_inc --debug --db-host localhost --db-sortinghat shdb --db-user shuser --db-password "${PASS}" git https://github.com/kubernetes/kubernetes.git --git-path kubernetes_kubernetes.git
else
  echo "Only identities mode"
  p2o.py --only-enrich --refresh-identities --index k8s_git_raw --index-enrich k8s_git -e http://localhost:9200 --no_inc --debug --db-host localhost --db-sortinghat shdb --db-user shuser --db-password "${PASS}" git https://github.com/kubernetes/kubernetes.git --git-path kubernetes_kubernetes.git
fi
