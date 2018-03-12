#!/bin/sh

. ./functions.sh

echo "iscsi-test-cu CompareAndWrite test"

create_target
create_disks
create_client
set_chap
add_disk_lun

#echo -e "SCSI.CompareAndWrite ... "
#echo -n "iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.CompareAndWrite  --dataloss"
#../test-tool/iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.CompareAndWrite  --dataloss > /dev/null || failure
#success

#echo -e "SCSI.CompareAndWrite.Simple"
#echo -n "iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.CompareAndWrite.Simple  --dataloss"
#../test-tool/iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.CompareAndWrite.Simple  --dataloss > /dev/null || failure
#success

#echo -e "SCSI.CompareAndWrite.DpoFua"
#echo -n "iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.CompareAndWrite.DpoFua  --dataloss"
#../test-tool/iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.CompareAndWrite.DpoFua  --dataloss > /dev/null || failure
#success

#echo -e "SCSI.CompareAndWrite.Miscompare"
#echo -n "iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.CompareAndWrite.Miscompare  --dataloss"
#../test-tool/iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.CompareAndWrite.Miscompare  --dataloss > /dev/null || failure
#success

echo -e "SCSI.CompareAndWrite.Unwritten"
echo -n "iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.CompareAndWrite.Unwritten --dataloss"
../test-tool/iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.CompareAndWrite.Unwritten --dataloss > /dev/null || failure
success

echo -e "SCSI.CompareAndWrite.InvalidDataOutSize"
echo -n "iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.CompareAndWrite.InvalidDataOutSize --dataloss"
../test-tool/iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.CompareAndWrite.InvalidDataOutSize --dataloss > /dev/null || failure
success

remove_disk_lun
unset_chap
delete_client
delete_disks
delete_target

exit 0
