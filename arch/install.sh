#!/bin/bash
echo "PegionFish's Arch Linux Installation Script"
echo "Wirtten by PegionFish, for use in mainland China only(You're gonna be pissed off if you're not there)"
echo "Please uset this script after you successfully configurated internet and drive, other things will be done automaticlly"
sleep 3

## rewrite mirrorlist with Chinese mirrorsp
echo "Using Mirror in Mainland CHina"
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
rm /etc/pacman.d/mirrorlist
cp mirrorlist_china /etc/pacman.d/mirrorlist
pacman -Sy

## pacstrap and install packages
echo "Installing necessery Software Packages"
pacstrap /mnt base base-devel linux linux-firmware nano neofetch
cp /etc/pacman.d/mirrorlist /mnt/etc/pacman.d/mirrorlist
chmod +r /etc/pacman.d/mirrorlist

## after installation configuration
echo "Generate Partition Table"
genfstab -U /mnt >> /mnt/etc/fstab

echo "chroot to installed Arch Linux environment"
arch-chroot /mnt bash config.sh
clear
## Greet user when everything is over
echo "Installation is complete. Set up password & reboot to your Arch Linux Build."