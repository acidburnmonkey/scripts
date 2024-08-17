#This script mounts xeno drive with luks

cryptsetup luksOpen /dev/sdb1 xeno --key-file /scripts/keyfile
mount /dev/mapper/xeno /media/xeno

# mounts toxic dirve
sudo mount -t ntfs-3g /dev/sda2 /media/Toxic
