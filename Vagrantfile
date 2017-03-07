# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

    # Create the standalone VM
    config.vm.define "salt" do |salt|
        salt.vm.hostname = "salt"
        salt.vm.box = "ubuntu/trusty64"
        salt.vm.network "forwarded_port", guest: 80, host: 8080

        # mount directories
        salt.vm.synced_folder "./", "/srv/salt"

        # bootstrap salt
        salt.vm.provision :shell, path: "bootstrap/salt.sh"
    end
end