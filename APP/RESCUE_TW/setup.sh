cp /root/AnySense_7688/APP/Harvard_TX/AnySense /etc/init.d
chmod 755 /etc/init.d/AnySense
/etc/init.d/AnySense enable


opkg update
opkg install wget block-mount kmod-fs-ext4 kmod-usb-storage-extras e2fsprogs fdisk
mkfs.ext4 /dev/mmcblk0p1

block detect > /etc/config/fstab
echo "	option	enabled	'1'" >> /etc/config/fstab

python /root/AnySense_7688/AnySense_RTC.py -d 0
crontab /root/AnySense_7688/APP/Harvard_TX/RTC_cron

reboot

