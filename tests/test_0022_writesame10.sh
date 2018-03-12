#!/bin/sh

. ./functions.sh

echo "iscsi-test-cu SCSI.WriteSame10 test"

create_target
create_disks
create_client
set_chap
add_disk_lun

#echo -e "SCSI.WriteSame10 ... "
#echo -n "iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.WriteSame10  --dataloss"
#../test-tool/iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.WriteSame10  --dataloss > /dev/null || failure
#success

#echo -e "SCSI.WriteSame10.WriteProtect ... "
#echo -n "iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.WriteSame10.WriteProtect  --dataloss"
#../test-tool/iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.WriteSame10.WriteProtect  --dataloss > /dev/null || failure
#success

#echo -e "SCSI.WriteSame10.Unmap ... "
#echo -n "iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.WriteSame10.Unmap  --dataloss"
#../test-tool/iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.WriteSame10.Unmap  --dataloss > /dev/null || failure
#success

echo -e "SCSI.WriteSame10.Simple"
echo -n "iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.WriteSame10.Simple  --dataloss"
../test-tool/iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.WriteSame10.Simple  --dataloss > /dev/null || failure
success

echo -e "SCSI.WriteSame10.BeyondEol"
echo -n "iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.WriteSame10.BeyondEol  --dataloss"
../test-tool/iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.WriteSame10.BeyondEol  --dataloss > /dev/null || failure
success

echo -e "SCSI.WriteSame10.ZeroBlocks"
echo -n "iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.WriteSame10.ZeroBlocks  --dataloss"
../test-tool/iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.WriteSame10.ZeroBlocks  --dataloss > /dev/null || failure
success

echo -e "SCSI.WriteSame10.UnmapUnaligned"
echo -n "iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.WriteSame10.UnmapUnaligned  --dataloss"
../test-tool/iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.WriteSame10.UnmapUnaligned  --dataloss > /dev/null || failure
success

echo -e "SCSI.WriteSame10.UnmapUntilEnd"
echo -n "iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.WriteSame10.UnmapUntilEnd  --dataloss"
../test-tool/iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.WriteSame10.UnmapUntilEnd  --dataloss > /dev/null || failure
success

echo -e "SCSI.WriteSame10.UnmapVPD"
echo -n "iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.WriteSame10.UnmapVPD  --dataloss"
../test-tool/iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.WriteSame10.UnmapVPD  --dataloss > /dev/null || failure
success

echo -e "SCSI.WriteSame10.Check"
echo -n "iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.WriteSame10.Check  --dataloss"
../test-tool/iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.WriteSame10.Check  --dataloss > /dev/null || failure
success

echo -e "SCSI.WriteSame10.InvalidDataOutSize"
echo -n "iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.WriteSame10.InvalidDataOutSize  --dataloss"
../test-tool/iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.WriteSame10.InvalidDataOutSize  --dataloss > /dev/null || failure
success

remove_disk_lun
unset_chap
delete_client
delete_disks
delete_target

exit 0
