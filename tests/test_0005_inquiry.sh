#!/bin/sh

. ./functions.sh

echo "iscsi-test-cu Inquiry test"

create_target
create_disks
create_client
set_chap
add_disk_lun

#echo -e "SCSI.Inquiry ... "
#echo -n "iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.Inquiry  --dataloss"
#../test-tool/iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.Inquiry  --dataloss > /dev/null || failure
#success
#echo -e "SCSI.Inquiry.Standard"
#echo -n "iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.Inquiry.Standard  --dataloss"
#../test-tool/iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.Inquiry.Standard  --dataloss > /dev/null || failure
#success
#echo -e "SCSI.Inquiry.AllocLength"
#echo -n "iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.Inquiry.AllocLength  --dataloss"
#../test-tool/iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.Inquiry.AllocLength  --dataloss > /dev/null || failure
#success
echo -e "SCSI.Inquiry.EVPD"
echo -n "iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.Inquiry.EVPD  --dataloss"
../test-tool/iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.Inquiry.EVPD  --dataloss > /dev/null || failure
success
echo -e "SCSI.Inquiry.MandatoryVPDSBC"
echo -n "iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.Inquiry.MandatoryVPDSBC  --dataloss"
../test-tool/iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.Inquiry.MandatoryVPDSBC  --dataloss > /dev/null || failure
success
echo -e "SCSI.Inquiry.SupportedVPD"
echo -n "iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.Inquiry.SupportedVPD  --dataloss"
../test-tool/iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.Inquiry.SupportedVPD  --dataloss > /dev/null || failure
success
echo -e "SCSI.Inquiry.VersionDescriptors"
echo -n "iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.Inquiry.VersionDescriptors  --dataloss"
../test-tool/iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.Inquiry.VersionDescriptors  --dataloss > /dev/null || failure
success
#echo -e "SCSI.Inquiry.BlockLimits"
#echo -n "iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.Inquiry.BlockLimits --dataloss"
#../test-tool/iscsi-test-cu -i ${IQNINITIATOR} ${ISCSIURL} -t SCSI.Inquiry.BlockLimits --dataloss > /dev/null || failure
#success

remove_disk_lun
unset_chap
delete_client
delete_disks
delete_target

exit 0
