IQNINITIATOR=iqn.1994-05.com.redhat:rh7-client
TGTPORTAL=172.16.135.133:3260
IQNTARGET=iqn.2003-01.com.redhat.iscsi-gw:ceph-igw
LIBISCSI_CHAP_USERNAME=yangzhaohui
LIBISCSI_CHAP_PASSWORD=012345678989
ISCSIURL=iscsi://${LIBISCSI_CHAP_USERNAME}%${LIBISCSI_CHAP_PASSWORD}@${TGTPORTAL}/${IQNTARGET}/0

create_target() {
#echo "Create iscsi target"

gwcli <<'END'
cd /iscsi-target
create iqn.2003-01.com.redhat.iscsi-gw:ceph-igw
END

sleep 2 

#echo "Create gateways node1"
gwcli <<'END'
cd /iscsi-target/iqn.2003-01.com.redhat.iscsi-gw:ceph-igw/gateways
create node1 172.16.135.133
END

sleep 2

#echo "Create gateways node0"
gwcli <<'END'
cd /iscsi-target/iqn.2003-01.com.redhat.iscsi-gw:ceph-igw/gateways
create node0 172.16.135.129
END
}

delete_target() {
sleep 2

#echo "Delete iscsi target"
gwcli <<'END'
cd /iscsi-target
clearconfig confirm=true
END
}

create_disks() {
sleep 2 

#echo "Create disk"
gwcli <<'END'
cd /disks
create pool=rbd image=disk_1 size=128m
END
}

delete_disks() {
sleep 2

#echo "Delete disk"
gwcli <<'END'
cd /disks
delete rbd.disk_1
END
}

create_client() {
sleep 2

#echo "Create iscsi client"
gwcli <<'END'
cd /iscsi-target/iqn.2003-01.com.redhat.iscsi-gw:ceph-igw/hosts
create iqn.1994-05.com.redhat:rh7-client
END
}

delete_client() {
sleep 2

#echo "Delete client"
gwcli <<'END'
cd /iscsi-target/iqn.2003-01.com.redhat.iscsi-gw:ceph-igw/hosts
delete iqn.1994-05.com.redhat:rh7-client
END
}

set_chap() {
sleep 2

#echo "set chap to iscsi client"
gwcli <<'END' 
cd /iscsi-target/iqn.2003-01.com.redhat.iscsi-gw:ceph-igw/hosts/iqn.1994-05.com.redhat:rh7-client
auth chap=yangzhaohui/012345678989
END
}

unset_chap() {
sleep 2

#echo "unset chap to iscsi client"
gwcli <<'END' 
cd /iscsi-target/iqn.2003-01.com.redhat.iscsi-gw:ceph-igw/hosts/iqn.1994-05.com.redhat:rh7-client
auth nochap=yangzhaohui/012345678989
END
}


add_disk_lun() {
sleep 2

#echo "Add lun to iscsi client"
gwcli <<'END'
cd /iscsi-target/iqn.2003-01.com.redhat.iscsi-gw:ceph-igw/hosts/iqn.1994-05.com.redhat:rh7-client
disk add rbd.disk_1
END
}

remove_disk_lun() {
sleep 2

#echo "Remove lun from iscsi client"
gwcli <<'END'
cd /iscsi-target/iqn.2003-01.com.redhat.iscsi-gw:ceph-igw/hosts/iqn.1994-05.com.redhat:rh7-client
disk remove rbd.disk_1
END
}

success() {
    echo "[OK]"
    rm ${TEST_TMP} 2> /dev/null
}

failure() {
    echo "[FAILED]"
    exit 1
}
