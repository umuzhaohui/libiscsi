#!/bin/sh

. ./functions.sh

create_target
create_disks
create_client
set_chap
add_disk_lun

exit 0
