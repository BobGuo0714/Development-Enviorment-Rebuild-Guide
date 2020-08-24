#!/bin/bash
echo "PegionFish's Arch Linux Installation Script"
echo "Wirtten by PegionFish, for use in mainland China only(You're gonna be pissed off if you're not there)"
echo "Please uset this script after you successfully configurated internet and drive, other things will be done automaticlly"
sleep 3

echo "Set timezone in Shanghai"
ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc --utc

echo "Configure locale.conf"
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
echo "en_US ISO-8859-1" >> /etc/locale.gen
echo "ja_JP.EUC-JP EUC-JP" >> /etc/locale.gen
echo "ja_JP.UTF-8 UTF-8" >> /etc/locale.gen
echo "zh_CN.GB18030 GB18030" >> /etc/locale.gen
echo "zh_CN.GBK GBK" >> /etc/locale.gen
echo "zh_CN.UTF-8 UTF-8" >> /etc/locale.gen
echo "zh_CN GB2312" >> /etc/locale.gen

echo "Generate locale setting"
locale-gen

echo "Set Language to English"
echo LANG=en_US.UTF-8 > /etc/locale.conf

echo "Set Hostname"
echo "$2" > /etc/hostname

echo "Set Hosts"
echo "127.0.0.1 localhost" > /etc/hosts
echo "::1 localhost" >> /etc/hosts
echo "127.0.1.1 $2.localdomain $2" >> /etc/hosts

## Install software packages
if $1 = "kde"
then 
    echo "Install KDE Plasma"
    pacman -Syu xorg plasma kde-applications-meta  --noconfirm
    echo "Install Desktop software"
    pacman -S sddm firefox vlc fcitx networkmanager openssh --noconfirm
    echo "Install Font"
    pacman -S noto-fonts noto-fonts-cjk noto-fonts-emoji adobe-source-han-sans-otc-fonts wqy-microhei wqy-zenhei --noconfirm
    systemctl enable sddm 
    systemctl enable NetworkManager
    echo "Success. Next will be bootloader"
elif
    echo "Install Server"
    pacman -Syu openssh git nano neofetch wget curl --noconfirm
    systemctl enable sshd
    echo "Install Network software"
    pacman -S dhcpcd iwd netctl wpa_supplicant dialog ppp
    systemctl enable netctl
    echo"Success. Next will be bootloader"
fi

## Install bootloader
echo "Installing GRUB package"
pacman -S efibootmgr dosfstools grub os-prober
echo "Install GRUB"
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=grub --recheck
echo "Configure GRUB"
grub-mkconfig -o /boot/grub/grub.cfg

## Setup Password
echo "Please set up your ROOT password. This password should NOT be shown to anyone"
passwd
clear
exit
