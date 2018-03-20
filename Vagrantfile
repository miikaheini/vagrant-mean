# Vagrantfile to set up a Ubuntu 16.04 Xenial MEAN stack

Vagrant.configure("2") do |config|
  # Use standard Ubuntu 64 bits version as server
  config.vm.box = "ubuntu/xenial64"
  config.vm.hostname = "vagrant-mean-stack"

  # Open ports for Node.js and MongoDB
  config.vm.network "forwarded_port", guest: 3000, host: 3000 # Node.js
  config.vm.network "forwarded_port", guest: 27017, host: 27017 # MongoDB

  # Create a private network for host-only access
  config.vm.network "private_network", ip: "192.168.20.10"

  # Set up a synced folder for specific project
  config.vm.synced_folder "/Users/<username>/projects", "/projects" # Codes, etc...

  # Provision VM only once
  config.vm.provision :shell, :path => "install_mean.sh"

end
