#!/bin/bash
echo "PegionFish's Arch Linux Installation Script"
echo "Wirtten by PegionFish, for use in mainland China only(You're gonna be pissed off if you're not there)"
echo "Please uset this script after you successfully configurated internet and drive, other things will be done automaticlly"
## rewrite mirrorlist with Chinese mirrorsp
echo "使用中国国内镜像"
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
rm /etc/pacman.d/mirrorlist
cp mirrorlist_china /etc/pacman.d/mirrorlist
pacman -Syyuu

## pacstrap and install packages
echo "安装软件包"
pacstrap /mnt base base-devel linux linux-firmware  nano
cp /etc/pacman.d/mirrorlist /mnt/etc/pacman.d/mirrorlist
chmod +r /etc/pacman.d/mirrorlist

## after installation configuration
echo "建立分区表"
genfstab -U /mnt >> /mnt/etc/fstab
echo "进入业已安装的Arch Linux环境"
arch-chroot /mnt
echo "设定时区为上海"
ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc --utc
echo "设置locale.conf"0
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
echo "en_US ISO-8859-1" >> /etc/locale.gen
echo "ja_JP.EUC-JP EUC-JP" >> /etc/locale.gen
echo "ja_JP.UTF-8 UTF-8" >> /etc/locale.gen
echo "zh_CN.GB18030 GB18030" >> /etc/locale.gen
echo "zh_CN.GBK GBK" >> /etc/locale.gen
echo "zh_CN.UTF-8 UTF-8" >> /etc/locale.gen
echo "zh_CN GB2312" >> /etc/locale.gen

echo "生成地域设置"
locale-gen

echo "设置语言（后期请在桌面环境中自行设置）"
echo LANG=en_US.UTF-8 > /etc/locale.conf

echo "设置主机名"
echo "$2" > /etc/hostname

echo "设置hosts"
echo "127.0.0.1 localhost" > /etc/hosts
echo "::1 localhost" >> /etc/hosts
echo "127.0.1.1 $2.localdomain $2" >> /etc/hosts

## Install software packages
if $1 = "server "
then 
    echo "安装KDE Plasma基础组成部分"
    pacman -Syu xorg plasma kde-applications-meta  --noconfirm
    echo "安装必要桌面工具"
    pacman -S sddm firefox vlc fcitx networkmanager openssh --noconfirm
    echo "安装字体"
    pacman -S noto-fonts noto-fonts-cjk noto-fonts-emoji adobe-source-han-sans-otc-fonts wqy-microhei wqy-zenhei --noconfirm
    systemctl enable sddm 
    systemctl enable NetworkManager
    echo "成功，下一步安装Bootloader"
elif
    echo "安装服务器组件"
    pacman -Syu openssh git nano neofetch wget curl --noconfirm
    systemctl enable sshd
    echo "安装网络组件"
    pacman -S dhcpcd iwd netctl wpa_supplicant dialog ppp
    systemctl enable netctl
    echo "成功，下一步安装Bootloader"

## Install bootloader
echo "安装GRUB软件包"
pacman -S efibootmgr dosfstools grub os-prober
echo "安装GRUB"
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=grub --recheck
echo "配置GRUB"
grub-mkconfig -o /boot/grub/grub.cfg
echo "安装成功。在设置密码与用户账户后请重启到Arch Linux环境下。"