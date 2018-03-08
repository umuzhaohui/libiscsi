#!/bin/sh

. ./functions.sh

echo "iscsi-test-cu Write12 test"

create_target
create_disks
create_client
set_chap
add_disk_lun 

#echo -e "SCSI.Write12 ... "
#echo -n "iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.Write12 --dataloss"
#../test-tool/iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.Write12 --dataloss > /dev/null || failure
#success

echo -e "SCSI.Write12.Simple ... "
echo -n "iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.Write12.Simple --dataloss"
../test-tool/iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.Write12.Simple --dataloss > /dev/null || failure
success

echo -e "SCSI.Write12.BeyondEol ... "
echo -n "iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.Write12.BeyondEol --dataloss"
../test-tool/iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.Write12.BeyondEol --dataloss > /dev/null || failure
success

echo -e "SCSI.Write12.ZeroBlocks ... "
echo -n "iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.Write12.ZeroBlocks --dataloss"
../test-tool/iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.Write12.ZeroBlocks --dataloss > /dev/null || failure
success

echo -e "SCSI.Write12.ReadProtect ... "
echo -n "iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.Write12.WriteProtect --dataloss"
../test-tool/iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.Write12.ReadProtect --dataloss > /dev/null || failure
success

#echo -e "SCSI.Write12.DpoFua ... "
#echo -n "iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.Write12.DpoFua --dataloss"
#../test-tool/iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.Write12.DpoFua --dataloss > /dev/null || failure
#success

remove_disk_lun
unset_chap
delete_client
delete_disks
delete_target

exit 0
