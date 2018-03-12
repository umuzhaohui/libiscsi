#!/bin/sh

. ./functions.sh

echo "iscsi-test-cu SCSI.WriteSame16 test"

create_target
create_disks
create_client
set_chap
add_disk_lun

#echo -e "SCSI.WriteSame16 ... "
#echo -n "iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.WriteSame16  --dataloss"
#../test-tool/iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.WriteSame16  --dataloss > /dev/null || failure
#success

#echo -e "SCSI.WriteSame16.WriteProtect ... "
#echo -n "iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.WriteSame16.WriteProtect  --dataloss"
#../test-tool/iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.WriteSame16.WriteProtect  --dataloss > /dev/null || failure
#success

#echo -e "SCSI.WriteSame16.Unmap ... "
#echo -n "iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.WriteSame16.Unmap  --dataloss"
#../test-tool/iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.WriteSame16.Unmap  --dataloss > /dev/null || failure
#success

echo -e "SCSI.WriteSame16.Simple"
echo -n "iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.WriteSame16.Simple  --dataloss"
../test-tool/iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.WriteSame16.Simple  --dataloss > /dev/null || failure
success

echo -e "SCSI.WriteSame16.BeyondEol"
echo -n "iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.WriteSame16.BeyondEol  --dataloss"
../test-tool/iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.WriteSame16.BeyondEol  --dataloss > /dev/null || failure
success

echo -e "SCSI.WriteSame16.ZeroBlocks"
echo -n "iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.WriteSame16.ZeroBlocks  --dataloss"
../test-tool/iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.WriteSame16.ZeroBlocks  --dataloss > /dev/null || failure
success

echo -e "SCSI.WriteSame16.UnmapUnaligned"
echo -n "iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.WriteSame16.UnmapUnaligned  --dataloss"
../test-tool/iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.WriteSame16.UnmapUnaligned  --dataloss > /dev/null || failure
success

echo -e "SCSI.WriteSame16.UnmapUntilEnd"
echo -n "iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.WriteSame16.UnmapUntilEnd  --dataloss"
../test-tool/iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.WriteSame16.UnmapUntilEnd  --dataloss > /dev/null || failure
success

echo -e "SCSI.WriteSame16.UnmapVPD"
echo -n "iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.WriteSame16.UnmapVPD  --dataloss"
../test-tool/iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.WriteSame16.UnmapVPD  --dataloss > /dev/null || failure
success

echo -e "SCSI.WriteSame16.Check"
echo -n "iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.WriteSame16.Check  --dataloss"
../test-tool/iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.WriteSame16.Check  --dataloss > /dev/null || failure
success

echo -e "SCSI.WriteSame16.InvalidDataOutSize"
echo -n "iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.WriteSame16.InvalidDataOutSize  --dataloss"
../test-tool/iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.WriteSame16.InvalidDataOutSize  --dataloss > /dev/null || failure
success

remove_disk_lun
unset_chap
delete_client
delete_disks
delete_target

exit 0
