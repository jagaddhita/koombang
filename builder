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
repo init --depth=1 -u https://github.com/NusantaraProject-ROM/android_manifest -b 10 -g default,-device,-mips,-darwin,-notdefault &> /dev/null 
repo sync -c --force-sync --no-tags --no-clone-bundle &> /dev/null 
# Tree
git clone -b cm-11.0 --single-branch https://github.com/Nokia-xl-legacy/android_kernel_nokia_msm8625.git kernel/nokia/normandy &> /dev/null 
git clone https://github.com/Nokia-xl-legacy/device_xl.git device/nokia/xl &> /dev/null 
git clone https://github.com/Nokia-xl-legacy/vendor_xl.git vendor/nokia &> /dev/null 
# Edit tree
cd patches && chmod 775 apply.sh && ./apply.sh
cd ~/nusan
. build/envsetup.sh
lunch nad_ulysse-userdebug
mka nad -j
