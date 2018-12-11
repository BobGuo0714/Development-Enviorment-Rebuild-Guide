# Development-Enviorment-Rebuild-Guide
In order to help me sove problems when I need to install Ubuntu(Or other Linux distro again), I'm writing this file down to help me 

##1st System install  
My computer enviorment allows me to use 128 gig of my NVMe SM961 SSD and a 2Tb Seagate HDD to install Linux so I would spare them to this:  
All my SSD space would be mounted at root menu and every 1Tb of my HDD would be mounted on /home and on /usr.   
I know it is not the best or great way to spread my driver space but meh  

Usually I would go with Debian-based Linux distro so all software install codes are more or less useful on Debian based Linux.  
If your Linux distro is different from Ubuntu 18.04 LTS you should check if your distro have different name on certain applications.  
My default Linux distro for development and research is Ubuntu 18.04 LTS. I would use GNOME desktop enviorment because I'm most familar with that.  
Go with smallest install and install all applications you'll need next.  

##2nd Needed applications installation
Due to that I need to code under both C and python, usually I would just apt-get and install these apps.
My favourite editor is Microsoft's Visual Studio Code and I basiclly use it all over my platform(Windows\macOS\Linux)and all I need to do is just download it from its website and install it.
Basiclly all applications I need to install from APT-GET are as follwoes.  
  
sudo apt-get update && sudo apt-get upgrade  
sudo apt-get install gcc clang clemetine vlc cmatrix build-essestial   

For NVIDIA Driver\CUDA\Shadowsocks I need to use add-apt.

sudo add-apt-repository ppa:graphics-drivers/ppa  
sudo add-apt-repository ppa:hzwhuang/ss-qt5  
But since I'm using Bionic Beaver,I need to modify something in Software and Update.  
Saying "modify" but all I did is just changing Bionic to xenial and saved.  


sudo apt-get update
sudo ubuntu-drivers autoinstall && sudo apt-get install shadowsocks-qt5  
and after reboot  
sudo apt install nvidia-cuda-toolkit gcc-6  
and voila.  

For Google Chrome you could go with either just download deb pack directly or apt-get.  
I would write down how to go with apt-get (from StackOverflow)  

google-chrome-stable is available on a 3rd Party Repository: Google Chrome (for Stable).

Follow the instruction for installation:

Add Key:

wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
Set repository:

echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
Install package:

sudo apt-get update  
sudo apt-get install google-chrome-stable  

and that's it.
