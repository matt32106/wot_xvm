#!/bin/bash
echo "start"

# make sure to adapt those variables to your case
# tmp filename semi random so that it does not replace 
# a xvm.zip file in tmp
WOT_DIR="/PortWoT/drive_c/Games/World_of_Tanks/"
XVM_DWNLD="https://nightly.modxvm.com/download/master/xvm_latest.zip"
TMP_FILE="xvm.zip.jgjhgcshcjqy"

# download xvm zip file in tmp and extract it in wot dir then remove tmp file
cd /tmp
wget $XVM_DWNLD -O $TMP_FILE 
unzip -uo $TMP_FILE -d $WOT_DIR
rm $TMP_FILE
cd -

# tweak the hangar
echo "tweak files"
cd $WOT_DIR/res_mods/configs/xvm/default
cp hangar.xc hangar.xc.bak
sed -i "/enableGoldLocker/ s/false/true/" hangar.xc
sed -i "/enableFreeXpLocker/ s/false/true/" hangar.xc
sed -i "/enableCrewAutoReturn/ s/false/true/" hangar.xc
sed -i "/crewReturnByDefault/ s/false/true/" hangar.xc
sed -i "/defaultBoughtForCredits/ s/false/true/" hangar.xc
sed -i "/enableEquipAutoReturn/ s/false/true/" hangar.xc
sed -i "/blockVehicleIfLowAmmo/ s/false/true/" hangar.xc
sed -i "/lowAmmoPercentage/ s/\d+/100/" hangar.xc
sed -i "/showTeaserWidget/ s/true/false/" hangar.xc

# autologin -> true
cp login.xc login.xc.bak
sed -i "/autologin/ s/false/true/" login.xc
cd -
echo "finished"

# if all went well, you will find a file named with the xvm version in the wot dir
# for example: 8.2.0_42
