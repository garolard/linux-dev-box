# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  # Optional - enlarge disk (will also convert the format from VMDK to VDI):
  #config.disksize.size = "50GB"

  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = true
    vb.memory = 2048
    vb.cpus = 2
    vb.customize ["modifyvm", :id, "--vram", "128"]
  end

  config.vm.synced_folder "D:\\WS", "/home/vagrant/WS"

  # https://askubuntu.com/questions/1067929/on-18-04-package-virtualbox-guest-utils-does-not-exist
  config.vm.provision "shell", inline: "sudo apt-add-repository multiverse && sudo apt-get update"

  # Install xfce and virtualbox additions.
  # (Not sure if these packages could be helpful as well: virtualbox-guest-utils-hwe virtualbox-guest-x11-hwe)
  config.vm.provision "shell", inline: "sudo apt-get install -y xfce4 virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11"
  # Permit anyone to start the GUI
  config.vm.provision "shell", inline: "sudo sed -i 's/allowed_users=.*$/allowed_users=anybody/' /etc/X11/Xwrapper.config"

  # Optional: Use LightDM login screen (-> not required to run "startx")
  config.vm.provision "shell", inline: "sudo apt-get install -y lightdm lightdm-gtk-greeter"
  # Optional: Install a more feature-rich applications menu and a keyboard layout plugin
  config.vm.provision "shell", inline: "sudo apt-get install -y xfce4-whiskermenu-plugin xfce4-xkb-plugin"

  # Install basic tools like git, etc...
  config.vm.provision :shell, path: "basics.sh"

  # Install languages and compilers
  config.vm.provision :shell, path: "languages.sh"

  # Install tools like editors, ftp-clients, and so on...
  config.vm.provision :shell, path: "tools.sh"
end
