#!/bin/sh

. ./functions.sh

echo "iscsi-test-cu Read10 test"

create_target
create_disks
create_client
set_chap
add_disk_lun 

#echo -e "SCSI.Read10 ... "
#echo -n "iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.Read10 --dataloss"
#../test-tool/iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.Read10 --dataloss > /dev/null || failure
#success

echo -e "SCSI.Read10.Simple ... "
echo -n "iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.Read10.Simple --dataloss"
../test-tool/iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.Read10.Simple --dataloss > /dev/null || failure
success

echo -e "SCSI.Read10.BeyondEol ... "
echo -n "iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.Read10.BeyondEol --dataloss"
../test-tool/iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.Read10.BeyondEol --dataloss > /dev/null || failure
success

echo -e "SCSI.Read10.ZeroBlocks ... "
echo -n "iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.Read10.ZeroBlocks --dataloss"
../test-tool/iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.Read10.ZeroBlocks --dataloss > /dev/null || failure
success

echo -e "SCSI.Read10.Async ... "
echo -n "iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.Read10.Async --dataloss"
../test-tool/iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.Read10.Async --dataloss > /dev/null || failure
success

#echo -e "SCSI.Read10.ReadProtect ... "
#echo -n "iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.Read10.ReadProtect --dataloss"
#../test-tool/iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.Read10.ReadProtect --dataloss > /dev/null || failure
#success

#echo -e "SCSI.Read10.DpoFua ... "
#echo -n "iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.Read10.DpoFua --dataloss"
#../test-tool/iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.Read10.DpoFua --dataloss > /dev/null || failure
#success

remove_disk_lun
unset_chap
delete_client
delete_disks
delete_target

exit 0
