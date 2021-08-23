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
# Prepair Compressed Source
wget --progress=bar https://nl1.androidfilehost.com/dl/0ehoBmTX8MV3fMb7KeUA8Q/1488412447/24591000424963926/CyanogenMod-cm-11.0-no-repo-20160907.tar.xz
tar -xvJf CyanogenMod-cm-11.0-no-repo-20160907.tar.xz &> /dev/null
cd CyanogenMod-cm-11.0-no-repo-20160907
repo sync -l &> /dev/null
# Download Device Tree
git clone -b cm-11.0 --single-branch https://github.com/Nokia-xl-legacy/android_kernel_nokia_msm8625.git kernel/nokia/normandy &> /dev/null
git clone https://github.com/Nokia-xl-legacy/device_xl.git device/nokia/xl &> /dev/null 
git clone https://github.com/Nokia-xl-legacy/vendor_xl.git vendor/nokia &> /dev/null 
rm -rf bootable/recovery && git clone -b android-5.1 --single-branch https://github.com/omnirom/android_bootable_recovery.git bootable/recovery &> /dev/null
rm -rf hardware/ril && git clone -b cm-11.0 --single-branch https://github.com/Nokia-xl-legacy/hardware_ril.git hardware/ril &> /dev/null
rm -rf hardware/qcom/gps && git clone https://github.com/Nokia-xl-legacy/android_hardware_qcom_gps.git hardware/qcom/gps &> /dev/null 
rm -rf hardware/qcom/media-legacy && git clone -b kitkat --single-branch https://github.com/Nokia-xl-legacy/android_hardware_qcom_media-legacy.git hardware/qcom/media-legacy &> /dev/null 
rm -rf external/webkit && git clone https://github.com/Nokia-xl-legacy/android_external_webkit.git external/webkit &> /dev/null
rm -rf hardware/qcom/display-legacy && git clone https://github.com/Nokia-xl-legacy/android_hardware_qcom_display-legacy.git hardware/qcom/display-legacy &> /dev/null
rm -rf hardware/atheros/wlan && git clone https://github.com/Nokia-xl-legacy/android_hardware_atheros_wlan.git -b cm-11.0 --single-branch hardware/atheros/wlan &> /dev/null
rm -rf hardware/atheros/wifi && git clone https://github.com/Nokia-xl-legacy/android_hardware_atheros_wifi_ath6kl-huawei.git hardware/atheros/wifi &> /dev/null 
# Edit device tree
cd patches && chmod 775 apply.sh && ./apply.sh
cd ~/android
. build/envsetup.sh
brunch xl
