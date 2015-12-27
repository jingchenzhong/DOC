#enviroment build
sudo apt-get install openjdk-7-jdk
sudo apt-get install git-core gnupg flex bison gperf build-essential \
  zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 \
  lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev ccache \
  libgl1-mesa-dev libxml2-utils xsltproc unzip

#download source 49G (6.0.1_r1)
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
../repo init -u https://android.googlesource.com/platform/manifest -b android-6.0.1_r1
../repo sync

#shadowsocks
sudo apt-get install python-pip
pip install shadowsocks
##config.js
{
"server":"2607:8700:104:4029::",
"server_port":443,
"local_port":1080,
"password":"YmUyNmE3OW",
"timeout":600,
"method":"aes-256-cfb"
}
## or shell command
sslocal -s "2607:8700:104:4029::" -p 443 -m "aes-256-cfb" -k "YmUyNmE3OW"

##build system
download driver from [google nexus driver link](https://developers.google.com/android/nexus/drivers#shamummb29k)
source build/envsetup.sh
lunch  (user>user debug>eng)  (may select shamu for nexus 6)
make -j4

###ref:
[cyanogenmod](https://wiki.cyanogenmod.org/w/Build_for_shamu)
[nexus5 L](http://www.jcodecraeer.com/a/anzhuokaifa/androidkaifa/2015/0210/2455.html)
[source android](https://source.android.com/source/building.html)


###cache:

