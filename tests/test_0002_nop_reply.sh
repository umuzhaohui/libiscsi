#!/bin/sh

. ./functions.sh

echo "NOP reply tests"

create_target
create_disks
create_client
set_chap
add_disk_lun

echo -e "Test that we reply to target initiated NOPs correctly ... "
echo -n "prog_noop_reply -i ${IQNINITIATOR} ${ISCSIURL}"
./prog_noop_reply -i ${IQNINITIATOR} ${ISCSIURL} > /dev/null || failure
success

remove_disk_lun
unset_chap
delete_client
delete_disks
delete_target

exit 0
