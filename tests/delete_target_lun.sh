#!/bin/sh

. ./functions.sh

remove_disk_lun
unset_chap
delete_client
delete_disks
delete_target

exit 0
