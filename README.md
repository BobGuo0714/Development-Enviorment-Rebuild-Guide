# Arch linux Benchmarking Live CD
This repo contains all files to make a Arch Linux Live CD for benchmarking and testing before purchasing a new device. It should work on all x86-64 powered mainstream PC/Laptop/Tablet/Server, with or without dGPU. 

## Table of Contents

- [Introduction of my devices](#introduction)   
- [Requirements](#requirements)
- [Usage](#usage)
- [Build](#build)
- [Shoutout](#thankyou)
## Introduction

Since I write lots of articles related to reviewing Consumer Electronics, it is quite clear that I need to build a Linux environment to make sure my benchmark's result is worth mentioning since different BIOS/UEFI Firmware version\Hardware Driver, and/or software edition will make a impact here. Hence, making a bootable Live CD image for my Linux benchmarking environment is a good method to make sure all my benchmark works under a stable environment.

## Requirements

Since this benchmarks is based on Arch Linux, you *should* be able to run it on any computer system that can run Arch Linux. But due to the fact that this is a modded image, you should draw the baseline higher.  
And please keep in mind that my release is optimized for users in Mainland China only, so I configurated my release with TUNA Mirror. This may cause you slow connection speed for pacman so please configurate your 
> /etc/pacman.d/mirrorlist  
> /etc/pacman.conf

manually if you're outside Mainland China. Also, the default include for ArchLinuxCN(A collection for prebuilt AUR packages that are widely used in Mainland China) may cause some copyright issue so if you're a copyright freak (no offensive) please delete that form 
> /etc/pacman.conf

and install all your required packages manually.

## Usage

Burn the ISO onto a USB Flash Drive via tools like rufus or etcher , plug the drive into USB port and Voilà you're in LiveCD.  
If your PC is powerful enough for a GUI, type
> startx

to run KDE on LiveCD. A GUI should help you a lot in benchmarking your GPU.

## Build

Since I'm just a nobody on the Internet, you should't trust binary images from me. I mean I'm not a bad guy, and hell I wouldn't release a infected image - covid-19 has had all of us fxxked and [I really don't want to set the world on fire](https://www.youtube.com/watch?v=6l6vqPUM_FE) - once again. But even you *can* truse me, somebody else on your web may do something bad to your image and tries to wreck your device up. To avoid that, I released all files for making this image up here and you can build it or do another mod for your need following [the guide from Arch Linux Wiki](https://wiki.archlinux.org/index.php/Archiso).This is the most recommend way.   
But if all you want to do is just build your own copy, git clone this repo and run
> ./build.sh -v

inside the folder. You should find the output file at *out/* .


## Thankyou

This project can't release without help form following projects:
* [Arch Linux](https://www.archlinux.org/)
* [GNU Project](https://www.gnu.org/home.en.html)
* [ArchlinuxCN](https://www.archlinuxcn.org/archlinux-cn-repo-and-mirror/)
* [TUNA](https://tuna.moe)

If you or your project's contribution to this repo is not mentioned here, please let me know via issue or [email](malito:boblao0714@gmail.com). I will reply asap.

## End
The README file is based on [Standard Readme](https://github.com/RichardLitt/standard-readme) made by Richard Litt.  

<a href="https://996.icu"><img src="https://img.shields.io/badge/link-996.icu-red.svg" alt="996.icu" /></a>  