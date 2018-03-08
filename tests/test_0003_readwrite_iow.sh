#!/bin/sh

. ./functions.sh

echo "Test Read/Write using iovectors"

create_target
create_disks
create_client
set_chap
add_disk_lun

echo -e "Test read/write using iovectors ... "
echo -n "prog_readwrite_iov -i ${IQNINITIATOR} ${ISCSIURL}"
./prog_readwrite_iov -i ${IQNINITIATOR} ${ISCSIURL} || failure
success

remove_disk_lun
unset_chap
delete_client
delete_disks
delete_target

exit 0
