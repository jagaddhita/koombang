# Fix build
sudo dpkg --configure -a && sudo apt install -f && sudo apt-get autoremove &> /dev/null
# Install build tools
sudo apt-get install -y lzop git-core gnupg flex bison gperf build-essential zip
  curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev
  libx11-dev lib32z-dev ccache libgl1-mesa-dev libxml2-utils xsltproc unzip maven
  schedtool &> /dev/null
# Install Java
sudo add-apt-repository -y ppa:openjdk-r/ppa && sudo apt-get update && sudo apt-get install openjdk-7-jdk &> /dev/null
# Install repo
curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ~/bin/repo && chmod a+x ~/bin/repo
echo "export USE_CCACHE=1" >> ~/.bashrc
echo "export PATH=~/bin:$PATH" >> ~/.bashrc
source ~/.bashrc
# Saus
mkdir nusan
cd nusan
repo init --depth=1 -u https://github.com/NusantaraProject-ROM/android_manifest -b 11 -g default,-device,-mips,-darwin,-notdefault &> /dev/null 
repo sync -c --force-sync --no-tags --no-clone-bundle &> /dev/null 
# Tree
git clone https://github.com/jagaddhita/device_xiaomi_ulysse -b eleven --depth=1 device/xiaomi/ulysse &> /dev/null 
git clone https://github.com/mgs28-mh/device_xiaomi_ulysse-common -b eleven --depth=1 device/xiaomi/ulysse-common &> /dev/null 
git clone https://github.com/mgs28-mh/vendor_xiaomi_ugg -b lineage-18.1 --depth=1 vendor/xiaomi/ugg &> /dev/null 
git clone https://github.com/mgs28-mh/kernel_xiaomi_ulysse-4.9 -b 11 --depth=1 kernel/xiaomi/ulysse &> /dev/null 
# Build setar
cd ~/nusan
. build/envsetup.sh
lunch nad_ulysse-eng
mka nad -j
