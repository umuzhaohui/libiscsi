#!/bin/sh

. ./functions.sh

echo "iscsi-test-cu StartStopUnit test for fixed media"

create_target
create_disks
create_client
set_chap
add_disk_lun

echo -e "SCSI.StartStopUnit ... "
echo -n "iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.StartStopUnit --dataloss"
../test-tool/iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.StartStopUnit --dataloss > /dev/null || failure
success

remove_disk_lun
unset_chap
delete_client
delete_disks
delete_target

exit 0
