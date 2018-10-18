#!/bin/bash
if [ -z "${PASS}" ]
then
  echo -n "SortingHat DB Password: "
  read -s PASS
fi
if [ -z "${IDENTITIES}" ]
then
  p2o.py --enrich --index git_raw --index-enrich git -e http://localhost:9200 --no_inc --debug --db-host localhost --db-sortinghat shdb --db-user shuser --db-password "${PASS}" git https://gerrit.onosproject.org/onos --category commit --git-path opennetworkinglab_onos.git > .perceval_onos.git.log || exit 1
  p2o.py --enrich --index git_raw --index-enrich git -e http://localhost:9200 --no_inc --debug --db-host localhost --db-sortinghat shdb --db-user shuser --db-password "${PASS}" git https://gerrit.onosproject.org/onos-felix --category commit --git-path opennetworkinglab_onos-felix.git >> .perceval_onos.git.log || exit 1
  p2o.py --enrich --index git_raw --index-enrich git -e http://localhost:9200 --no_inc --debug --db-host localhost --db-sortinghat shdb --db-user shuser --db-password "${PASS}" git https://gerrit.onosproject.org/spring-open --category commit --git-path opennetworkinglab_spring-open.git >> .perceval_onos.git.log || exit 1
  p2o.py --enrich --index git_raw --index-enrich git -e http://localhost:9200 --no_inc --debug --db-host localhost --db-sortinghat shdb --db-user shuser --db-password "${PASS}" git https://gerrit.onosproject.org/OnosSystemTest --category commit --git-path opennetworkinglab_OnosSystemTest.git >> .perceval_onos.git.log || exit 1
  p2o.py --enrich --index git_raw --index-enrich git -e http://localhost:9200 --no_inc --debug --db-host localhost --db-sortinghat shdb --db-user shuser --db-password "${PASS}" git https://gerrit.onosproject.org/onos-loxi --category commit --git-path opennetworkinglab_onos-loxi.git >> .perceval_onos.git.log || exit 1
  p2o.py --enrich --index git_raw --index-enrich git -e http://localhost:9200 --no_inc --debug --db-host localhost --db-sortinghat shdb --db-user shuser --db-password "${PASS}" git https://gerrit.onosproject.org/onos-yang-tools --category commit --git-path opennetworkinglab_onos-yang-tools.git >> .perceval_onos.git.log || exit 1
  p2o.py --enrich --index git_raw --index-enrich git -e http://localhost:9200 --no_inc --debug --db-host localhost --db-sortinghat shdb --db-user shuser --db-password "${PASS}" git https://gerrit.onosproject.org/fabric-control --category commit --git-path opennetworkinglab_fabric-control.git >> .perceval_onos.git.log || exit 1
  p2o.py --enrich --index git_raw --index-enrich git -e http://localhost:9200 --no_inc --debug --db-host localhost --db-sortinghat shdb --db-user shuser --db-password "${PASS}" git https://gerrit.onosproject.org/onos-vm --category commit --git-path opennetworkinglab_onos-vm.git >> .perceval_onos.git.log || exit 1
  p2o.py --enrich --index git_raw --index-enrich git -e http://localhost:9200 --no_inc --debug --db-host localhost --db-sortinghat shdb --db-user shuser --db-password "${PASS}" git https://gerrit.onosproject.org/onos-app-samples --category commit --git-path opennetworkinglab_onos-app-samples.git >> .perceval_onos.git.log || exit 1
  p2o.py --enrich --index git_raw --index-enrich git -e http://localhost:9200 --no_inc --debug --db-host localhost --db-sortinghat shdb --db-user shuser --db-password "${PASS}" git https://gerrit.onosproject.org/vm-build --category commit --git-path opennetworkinglab_vm-build.git >> .perceval_onos.git.log || exit 1
  p2o.py --enrich --index git_raw --index-enrich git -e http://localhost:9200 --no_inc --debug --db-host localhost --db-sortinghat shdb --db-user shuser --db-password "${PASS}" git https://gerrit.onosproject.org/routing --category commit --git-path opennetworkinglab_routing.git >> .perceval_onos.git.log || exit 1
  p2o.py --enrich --index git_raw --index-enrich git -e http://localhost:9200 --no_inc --debug --db-host localhost --db-sortinghat shdb --db-user shuser --db-password "${PASS}" git https://gerrit.onosproject.org/olt-oftest --category commit --git-path opennetworkinglab_olt-offset.git >> .perceval_onos.git.log || exit 1
  p2o.py --enrich --index git_raw --index-enrich git -e http://localhost:9200 --no_inc --debug --db-host localhost --db-sortinghat shdb --db-user shuser --db-password "${PASS}" git https://gerrit.onosproject.org/onos-nemo --category commit --git-path opennetworkinglab_onos-nemo.git >> .perceval_onos.git.log || exit 1
  p2o.py --enrich --index git_raw --index-enrich git -e http://localhost:9200 --no_inc --debug --db-host localhost --db-sortinghat shdb --db-user shuser --db-password "${PASS}" git https://gerrit.onosproject.org/spring-open-cli --category commit --git-path opennetworkinglab_spring-open-cli.git >> .perceval_onos.git.log || exit 1
  p2o.py --enrich --index git_raw --index-enrich git -e http://localhost:9200 --no_inc --debug --db-host localhost --db-sortinghat shdb --db-user shuser --db-password "${PASS}" git https://gerrit.onosproject.org/onos-gerrit-base --category commit --git-path opennetworkinglab_onos-gerrit-base.git >> .perceval_onos.git.log || exit 1
  p2o.py --enrich --index git_raw --index-enrich git -e http://localhost:9200 --no_inc --debug --db-host localhost --db-sortinghat shdb --db-user shuser --db-password "${PASS}" git https://gerrit.onosproject.org/manifest --category commit --git-path opennetworkinglab_manifest.git >> .perceval_onos.git.log || exit 1
  p2o.py --enrich --index git_raw --index-enrich git -e http://localhost:9200 --no_inc --debug --db-host localhost --db-sortinghat shdb --db-user shuser --db-password "${PASS}" git https://gerrit.onosproject.org/OnosSystemTestJenkins --category commit --git-path opennetworkinglab_OnosSystemTestJenkins.git >> .perceval_onos.git.log || exit 1
  p2o.py --enrich --index git_raw --index-enrich git -e http://localhost:9200 --no_inc --debug --db-host localhost --db-sortinghat shdb --db-user shuser --db-password "${PASS}" git https://gerrit.onosproject.org/cord-openwrt --category commit --git-path opennetworkinglab_cord-openwrt.git >> .perceval_onos.git.log || exit 1
else
  echo "Only identities mode"
  p2o.py --only-enrich --refresh-identities --index git_raw --index-enrich git -e http://localhost:9200 --no_inc --debug --db-host localhost --db-sortinghat shdb --db-user shuser --db-password "${PASS}" git https://gerrit.onosproject.org/onos --category commit --git-path opennetworkinglab_onos.git > .perceval_onos.git.log || exit 1
  p2o.py --only-enrich --refresh-identities --index git_raw --index-enrich git -e http://localhost:9200 --no_inc --debug --db-host localhost --db-sortinghat shdb --db-user shuser --db-password "${PASS}" git https://gerrit.onosproject.org/onos-felix --category commit --git-path opennetworkinglab_onos-felix.git >> .perceval_onos.git.log || exit 1
  p2o.py --only-enrich --refresh-identities --index git_raw --index-enrich git -e http://localhost:9200 --no_inc --debug --db-host localhost --db-sortinghat shdb --db-user shuser --db-password "${PASS}" git https://gerrit.onosproject.org/spring-open --category commit --git-path opennetworkinglab_spring-open.git >> .perceval_onos.git.log || exit 1
  p2o.py --only-enrich --refresh-identities --index git_raw --index-enrich git -e http://localhost:9200 --no_inc --debug --db-host localhost --db-sortinghat shdb --db-user shuser --db-password "${PASS}" git https://gerrit.onosproject.org/OnosSystemTest --category commit --git-path opennetworkinglab_OnosSystemTest.git >> .perceval_onos.git.log || exit 1
  p2o.py --only-enrich --refresh-identities --index git_raw --index-enrich git -e http://localhost:9200 --no_inc --debug --db-host localhost --db-sortinghat shdb --db-user shuser --db-password "${PASS}" git https://gerrit.onosproject.org/onos-loxi --category commit --git-path opennetworkinglab_onos-loxi.git >> .perceval_onos.git.log || exit 1
  p2o.py --only-enrich --refresh-identities --index git_raw --index-enrich git -e http://localhost:9200 --no_inc --debug --db-host localhost --db-sortinghat shdb --db-user shuser --db-password "${PASS}" git https://gerrit.onosproject.org/onos-yang-tools --category commit --git-path opennetworkinglab_onos-yang-tools.git >> .perceval_onos.git.log || exit 1
  p2o.py --only-enrich --refresh-identities --index git_raw --index-enrich git -e http://localhost:9200 --no_inc --debug --db-host localhost --db-sortinghat shdb --db-user shuser --db-password "${PASS}" git https://gerrit.onosproject.org/fabric-control --category commit --git-path opennetworkinglab_fabric-control.git >> .perceval_onos.git.log || exit 1
  p2o.py --only-enrich --refresh-identities --index git_raw --index-enrich git -e http://localhost:9200 --no_inc --debug --db-host localhost --db-sortinghat shdb --db-user shuser --db-password "${PASS}" git https://gerrit.onosproject.org/onos-vm --category commit --git-path opennetworkinglab_onos-vm.git >> .perceval_onos.git.log || exit 1
  p2o.py --only-enrich --refresh-identities --index git_raw --index-enrich git -e http://localhost:9200 --no_inc --debug --db-host localhost --db-sortinghat shdb --db-user shuser --db-password "${PASS}" git https://gerrit.onosproject.org/onos-app-samples --category commit --git-path opennetworkinglab_onos-app-samples.git >> .perceval_onos.git.log || exit 1
  p2o.py --only-enrich --refresh-identities --index git_raw --index-enrich git -e http://localhost:9200 --no_inc --debug --db-host localhost --db-sortinghat shdb --db-user shuser --db-password "${PASS}" git https://gerrit.onosproject.org/vm-build --category commit --git-path opennetworkinglab_vm-build.git >> .perceval_onos.git.log || exit 1
  p2o.py --only-enrich --refresh-identities --index git_raw --index-enrich git -e http://localhost:9200 --no_inc --debug --db-host localhost --db-sortinghat shdb --db-user shuser --db-password "${PASS}" git https://gerrit.onosproject.org/routing --category commit --git-path opennetworkinglab_routing.git >> .perceval_onos.git.log || exit 1
  p2o.py --only-enrich --refresh-identities --index git_raw --index-enrich git -e http://localhost:9200 --no_inc --debug --db-host localhost --db-sortinghat shdb --db-user shuser --db-password "${PASS}" git https://gerrit.onosproject.org/olt-oftest --category commit --git-path opennetworkinglab_olt-offset.git >> .perceval_onos.git.log || exit 1
  p2o.py --only-enrich --refresh-identities --index git_raw --index-enrich git -e http://localhost:9200 --no_inc --debug --db-host localhost --db-sortinghat shdb --db-user shuser --db-password "${PASS}" git https://gerrit.onosproject.org/onos-nemo --category commit --git-path opennetworkinglab_onos-nemo.git >> .perceval_onos.git.log || exit 1
  p2o.py --only-enrich --refresh-identities --index git_raw --index-enrich git -e http://localhost:9200 --no_inc --debug --db-host localhost --db-sortinghat shdb --db-user shuser --db-password "${PASS}" git https://gerrit.onosproject.org/spring-open-cli --category commit --git-path opennetworkinglab_spring-open-cli.git >> .perceval_onos.git.log || exit 1
  p2o.py --only-enrich --refresh-identities --index git_raw --index-enrich git -e http://localhost:9200 --no_inc --debug --db-host localhost --db-sortinghat shdb --db-user shuser --db-password "${PASS}" git https://gerrit.onosproject.org/onos-gerrit-base --category commit --git-path opennetworkinglab_onos-gerrit-base.git >> .perceval_onos.git.log || exit 1
  p2o.py --only-enrich --refresh-identities --index git_raw --index-enrich git -e http://localhost:9200 --no_inc --debug --db-host localhost --db-sortinghat shdb --db-user shuser --db-password "${PASS}" git https://gerrit.onosproject.org/manifest --category commit --git-path opennetworkinglab_manifest.git >> .perceval_onos.git.log || exit 1
  p2o.py --only-enrich --refresh-identities --index git_raw --index-enrich git -e http://localhost:9200 --no_inc --debug --db-host localhost --db-sortinghat shdb --db-user shuser --db-password "${PASS}" git https://gerrit.onosproject.org/OnosSystemTestJenkins --category commit --git-path opennetworkinglab_OnosSystemTestJenkins.git >> .perceval_onos.git.log || exit 1
  p2o.py --only-enrich --refresh-identities --index git_raw --index-enrich git -e http://localhost:9200 --no_inc --debug --db-host localhost --db-sortinghat shdb --db-user shuser --db-password "${PASS}" git https://gerrit.onosproject.org/cord-openwrt --category commit --git-path opennetworkinglab_cord-openwrt.git >> .perceval_onos.git.log || exit 1
fi
