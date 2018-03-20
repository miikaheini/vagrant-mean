#!/usr/bin/env bash

echo "Provisioning MEAN VM START"
echo "======================================"
echo "Following tasks will be completed"
echo " -Update repositories and upgrade"
echo " -Install Build-essentials"
echo " -Install Git"
echo " -Install MongoDB version 3.6"
echo " -Install Node.js version 8.x"
echo " -Update NPM install"
echo "======================================"

# Define packages
BUILD_ESSENTIAL="build-essential"
GIT="git"
MONGO="mongodb-org"
NODE="nodejs"


# Update all repositories and server
sudo apt-get update
sudo apt-get -y upgrade

# Install build-essentials
BUILD_ESSENTIAL_INSTALLED=$(dpkg-query -W --showformat='${Status}\n' $BUILD_ESSENTIAL | grep "install ok installed")
echo "Checking for $BUILD_ESSENTIAL: $BUILD_ESSENTIAL_INSTALLED"
if [ "" == "$BUILD_ESSENTIAL_INSTALLED" ]; then
  sudo apt-get -y install build-essential curl ftp unzip python-software-properties python g++ libssl-dev
fi

# Install Git
GIT_INSTALLED=$(dpkg-query -W --showformat='${Status}\n' $GIT | grep "install ok installed")
echo "Checking for $GIT: $GIT_INSTALLED"
if [ "" == "$GIT_INSTALLED" ]; then
  sudo apt-get -y install git
fi

# Install MongoDB version 3.6
MONGO_INSTALLED=$(dpkg-query -W --showformat='${Status}\n' $MONGO | grep "install ok installed")
echo "Checking for $MONGO: $MONGO_INSTALLED"
if [ "" == "$MONGO_INSTALLED" ]; then
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5
  echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.6 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.6.list
  sudo apt-get update
  sudo apt-get -y install mongodb-org mongodb-org-server mongodb-org-shell mongodb-org-mongos mongodb-org-tools
fi

# Install Node.js
NODE_INSTALLED=$(dpkg-query -W --showformat='${Status}\n' $NODE | grep "install ok installed")
echo "Checking for $NODE: $NODE_INSTALLED"
if [ "" == "$NODE_INSTALLED" ]; then
  curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
  sudo apt-get -y install nodejs

  # Upgrade NPM to latest version
  npm install -g npm
fi
