#!/bin/sh

. ./functions.sh

echo "iscsi-test-cu Read16 test"

create_target
create_disks
create_client
set_chap
add_disk_lun 

#echo -e "SCSI.Read16 ... "
#echo -n "iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.Read16 --dataloss"
#../test-tool/iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.Read16 --dataloss > /dev/null || failure
#success

echo -e "SCSI.Read16.Simple ... "
echo -n "iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.Read16.Simple --dataloss"
../test-tool/iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.Read16.Simple --dataloss > /dev/null || failure
success

echo -e "SCSI.Read16.BeyondEol ... "
echo -n "iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.Read16.BeyondEol --dataloss"
../test-tool/iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.Read16.BeyondEol --dataloss > /dev/null || failure
success

echo -e "SCSI.Read16.ZeroBlocks ... "
echo -n "iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.Read16.ZeroBlocks --dataloss"
../test-tool/iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.Read16.ZeroBlocks --dataloss > /dev/null || failure
success

echo -e "SCSI.Read16.Async ... "
echo -n "iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.Read16.Async --dataloss"
../test-tool/iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.Read16.Async --dataloss > /dev/null || failure
success

#echo -e "SCSI.Read16.ReadProtect ... "
#echo -n "iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.Read16.ReadProtect --dataloss"
#../test-tool/iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.Read16.ReadProtect --dataloss > /dev/null || failure
#success

#echo -e "SCSI.Read16.DpoFua ... "
#echo -n "iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.Read16.DpoFua --dataloss"
#../test-tool/iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.Read16.DpoFua --dataloss > /dev/null || failure
#success

remove_disk_lun
unset_chap
delete_client
delete_disks
delete_target

exit 0
