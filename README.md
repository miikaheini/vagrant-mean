# vagrant-mean-stack
Vagrantfile and provisioning script to setup MEAN stack virtual machine. Consists of following components:
* Ubuntu 16.04 Xenial
  * Build-essential
  * curl
  * ftp
  * unzip
  * python-software-properties
  * python
  * g++
  * libssl-dev
* MongoDB 3.6
* Git
* Node.js 8.x

## Instructions
### Install Vagrant
Install Vagrant as described in: https://www.vagrantup.com

Install VirtualBox as described in: https://www.virtualbox.org

### Spin up the virtual machine
Clone files in folder of choice:
```
mkdir meanStack
cd meanStack
git clone https://github.com/miikaheini/vagrant-mean-stack.git
```

Configure the folder that you want to sync with your virtual machine in `install_mean.sh` on row 16:
```
config.vm.synced_folder "/Users/<username>/projects", "/projects"
```

Start the virtual machine and login via SSH
```
vagrant up
vagrant ssh
```
