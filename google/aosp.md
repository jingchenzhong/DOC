#enviroment build
sudo apt-get install openjdk-7-jdk
sudo apt-get install git-core gnupg flex bison gperf build-essential \
  zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 \
  lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev ccache \
  libgl1-mesa-dev libxml2-utils xsltproc unzip

#download source 49G (6.0.1_r1)
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


