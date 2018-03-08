#!/bin/sh

. ./functions.sh

echo "Login tests"

create_target
create_disks
create_client
set_chap
add_disk_lun 

echo -e "Test logging in to target ... "
echo -n "iscsi-inq -i ${IQNINITIATOR} ${ISCSIURL}"
../utils/iscsi-inq -i ${IQNINITIATOR} ${ISCSIURL} > /dev/null || failure
success

remove_disk_lun
unset_chap
delete_client
delete_disks
delete_target

exit 0
