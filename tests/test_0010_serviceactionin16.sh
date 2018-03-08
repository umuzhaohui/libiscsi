#!/bin/sh

. ./functions.sh

echo "iscsi-test-cu ReadCapacity16 test"

create_target
create_disks
create_client
set_chap
add_disk_lun

echo -e "SCSI.ReadCapacity16 ... "
echo -n "iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.ReadCapacity16 --dataloss"
../test-tool/iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.ReadCapacity16 --dataloss > /dev/null || failure
success

remove_disk_lun
unset_chap
delete_client
delete_disks
delete_target

exit 0
