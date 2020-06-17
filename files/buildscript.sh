#!/bin/sh

#Placing terminal to the starting folder
cd /usr/share/artools/

#Ask the user where are the archiso files
buildiso -p base -q

#Clone the lhos repo
git clone https://github.com/Lin1337/artix-build-script.git
mv artix-build-script/iso-profiles/* ./iso-profiles/
mv artix-build-script/pacman-default.conf .
#Go to this new working folder
echo "what init ?"
read init
buildiso -p zfs -i $init -q
#Run the script to build the ISO
#Move the final ISO to /tmp to be accessible from the host
mv out/*.iso /tmp