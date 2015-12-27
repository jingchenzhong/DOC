nexus 6 image: (MMB29K)

#folder files:
bootloader-shamu-moto-apq8084-71.15.img
flash-all.bat
flash-all.sh
flash-base.sh
image-shamu-mmb29k.zip
radio-shamu-d4.01-9625-05.32+fsg-9625-02.109.img

#bootloader: (base 1)
fastboot flash bootloader bootloader-shamu-moto-apq8084-71.15.img
fastboot reboot-bootloader

#radio: (base 2)
fastboot flash radio radio-shamu-d4.01-9625-05.32+fsg-9625-02.109.img
fastboot reboot-bootloader

#image-shamu: (all 3)
fastboot -w update image-shamu-mmb29k.zip

## image:
boot.img 8.4M
cache.img 6.4M
recovery.img 9.1M
system.img 2.1G
userdata.img 142.2M

#driver: (extract sh file)
broadcom-shamu 290k
moto-shamu  126M
qcom-shamu  29M

##or other version contains drivers:
vendor image -> google   50M  
graphics,usb,video -> nvidia 300k

