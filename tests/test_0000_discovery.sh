#!/bin/sh

. ./functions.sh

echo "Discovery tests"

create_target
create_disks
create_client
set_chap
add_disk_lun


TEST_TMP=${0}.tmp
echo -e "Test discovery ... "
echo -n "iscsi-ls -i ${IQNINITIATOR} iscsi://${TGTPORTAL}"
../utils/iscsi-ls -i ${IQNINITIATOR} iscsi://${TGTPORTAL} > ${TEST_TMP} &&
grep ${IQNTARGET} ${TEST_TMP} > /dev/null || failure
success

remove_disk_lun
unset_chap
delete_client
delete_disks
delete_target

exit 0
