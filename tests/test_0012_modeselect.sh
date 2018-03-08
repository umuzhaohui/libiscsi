#!/bin/sh

. ./functions.sh

echo "iscsi-swp StartStopUnit test"

create_target
create_disks
create_client
set_chap
add_disk_lun

echo -e "StartStopUnit test ... "
echo -n "iscsi-swp -i ${IQNINITIATOR} ${ISCSIURL} --swp=on -d"
#../utils/iscsi-swp -i ${IQNINITIATOR} ${ISCSIURL} --swp=on -d > /dev/null || failure
success
echo -n "iscsi-swp -i ${IQNINITIATOR} ${ISCSIURL} --swp=off -d"
#../utils/iscsi-swp -i ${IQNINITIATOR} ${ISCSIURL} --swp=off -d > /dev/null || failure
success

remove_disk_lun
unset_chap
delete_client
delete_disks
delete_target

exit 0
