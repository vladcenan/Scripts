#!/bin/bash
#Set the space and storage variables
SPACE=100
STORAGE=/mpstorage

if ! rpm -qa | grep lvm2| grep lvm2-2  > /dev/null; then
   echo -e "Installing lvm2 package"
   yum install lvm2 -y
else
   echo -e "LVM2 is already installed"
fi

if [ -d $STORAGE ]; then
   echo -e "$STORAGE exists"
else
   echo -e "Creating $STORAGE as mount point"
   mkdir $STORAGE
fi

if [ -e /dev/xvdf ]; then
  pvcreate /dev/xvdf
  vgcreate vg0 /dev/xvdf
  lvcreate -L${SPACE}G -n vol1 vg0
 #lvcreate -l +100%FREE -n vol1 vg0
  mkfs -t ext4 /dev/vg0/vol1
  mount /dev/vg0/vol1 $STORAGE
else
  echo "No LVM was created.Please check the EBS attached to this VM."
fi

if [ -e /etc/fstab ]; then
  echo "/dev/mapper/vg0-vol1               $STORAGE              ext4    defaults        1 2" >> /etc/fstab
else
  echo "Please check if the volume is mounted in /etc/fstab"
  exit
fi
#Resize
#pvcreate /dev/xvdh
#vgextend vg0 /dev/xvdh
#lvextend -L+99G /dev/mapper/vg0-vol1
#resize2fs /dev/mapper/vg0-vol1
#
#Resize Verizon
#lsblk
#cfdisk /dev/sda ->create a new partition
#partx -v -a /dev/sdb -> Read disk and try to add all partitions to the system
#pvcreate /dev/sdb2
#vgextend VolGroup01 /dev/sdb2  
#lvextend -L+5G /dev/mapper/VolGroup01-lv_tmp 
#resize2fs /dev/mapper/VolGroup01-lv_tmp
