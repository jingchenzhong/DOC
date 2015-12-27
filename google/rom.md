#basic
bootloader - recovery
           - boot - system.img
                  - cache.img
                  - userdata.img
bootloader -> just a loader
radio.img -> gps radio 3G ... driver
recovery&boot -> include (linux+ramdisk/may also contain flash-wr io...) 
system -> android so/system-apk
userdata -> user apk

#Command
##bootloader:
adb reboot bootloader (after this, cannot use adb. fastboot can be used)
fastboot oem lock/unlock 
fastboot flash bootloader/recovery/system/all...

##recovery:
adb reboot recovery
sideloader -> push pc_file to your phone
offline connect usb -> update or upgrade your phone  (update.zip)


#root
update.zip(updater:update-binary; update.script(use recovery busybox command))
idea: busybox write su to system & modify su.c
mount -o rw,remount /system /my_system


#custom rom
system.img (open source compile result)-> unyaffs
           (nexus 6 factory img) -> simg2img -> mount

##unyaffs:
gcc -o unyaffs unyaffs.c
unyaffs system.img

##simg2img: (-s:sparse  -a:mount_point)
simg2img system.img system.img.raw
mount system.img.raw /mnt/system
modify...
make_ext4fs -s -l 512M -a system system.img /mnt/system
fastboot flash system system.img

#bootanimation.zip (boot logo animation)
adb push bootanimation.zip /sdcard/bootanimation.zip
adb shell 
su
mount -o rw,remount /system
cp /sdcard/bootanimation.zip /system/media/    (or /data/local/bootanimation.zip high priority)

#userdata.img(ram/inner memory/sdcard/otg)
simg2img
make_ext4fs -s -a data -l 128M...   (-l 1G)
fastboot flash userdata userdata.img
fastboot reboot

#ramdisk.img( aosp compile /root & zip to ramdisk)
mkdir ramdisk
cd ramdisk
gunzip -c ../ramdisk.img > ../ramdisk.cpio
cpio -i < ../ramdisk.img | cpio -i
(or one sentense: gunzip -c ../ramdisk.img | cpio -i)
modify init.rs... or put busybox into /sbin
mkbootfs . | minigzip > ../ramdisk.img.new

#boot.img(zImage+ramdisk.img)
mkdir boot
cd boot
unpackbootimg -i ../boot.img
modify...boot.img-zImage=>*.new  boot.img-ramdisk.gz =>*.new
mkbootimg --kernel boot.img-zImage.new --ramdisk boot.img-ramdisk.gz.new -o boot.img.new
##root may need modify 
boot.img->ramdisk.img->default.prop(Page 90)


#recovery.img
mkdir recovery
cd recovery
unpackbootimg -i ../recovery.img
(include recovery.img-zImage/-ramdisk.gz/-cmdline/-pagesize/-base)

##unpack recovery.img-ramdisk.gz
mkdir ramdisk
cd ramdisk
gunzip -c ../recovery.img-ramdisk.gz | cpio -i

##repack recovery.img
mkbootimg --kernel recovery.img-zImage --ramdisk recovery.img-ramdisk.gz.new -o recovery.img.new

##install recovery
adb reboot recovery
fastboot flash recovery recovery.img.new
fastboot reboot
adb reboot recovery


#cache.img
mkdir -p /mnt/rom/cache
make_ext4fs -s -l 256M -a cache cache.img /mnt/rom/cache
adb reboot bootloader
fastboot flash cache cache.img
fastboot reboot


#update.zip bootloader
android-info.txt: require board=grouper
                  require version-bootloader=4.18

boot.img recovery.img system.img userdata.img
adb reboot bootloader
fastboot erase boot/cache/recovery/system/userdata
fastboot -w update update.zip
fastboot reboot
may see some script (update.bat/.sh)


#recovery rom (Page 95)
(include meta-inf/system/boot.img)
meta-inf: updater-script update-binary
Edify language (Page 98)

#apk odex combine
##uncompile odex:
java -jar aksmali-2.0b4.jar -a 17 -x test.odex -d framework -o test
##test->classes.dex
java -jar smali-2.0b4.jar test -o classes.dex
##zip apk&classes.dex
##sign test.apk -> test_signed.apk
java -jar signapk.jar platform.x509.pem platform.pk8 test.apk test_signed.apk
