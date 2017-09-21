# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

	config.vm.hostname = "cedar"

	config.vm.box = "ubuntu/xenial64"

	config.vm.network :forwarded_port, guest: 80, host: 8888 # Cedar
	config.vm.network :forwarded_port, guest: 8080, host: 8080 # Fuseki

	config.vm.provider "virtualbox" do |v|
		v.memory = 3072
	end

	shared_dir = "/vagrant"

	config.vm.provision "shell", path: "./install_scripts/bootstrap.sh", args: shared_dir
	config.vm.provision "shell", path: "./install_scripts/dnsmasq.sh", args: shared_dir
	config.vm.provision "shell", path: "./install_scripts/fuseki.sh", args: shared_dir
	config.vm.provision "shell", path: "./install_scripts/ruby.sh", privileged: false, args: shared_dir
	config.vm.provision "shell", path: "./install_scripts/passenger.sh", privileged: false, args: shared_dir
	config.vm.provision "shell", path: "./install_scripts/cedar.sh", privileged: false, args: shared_dir
	config.vm.provision "shell", path: "./install_scripts/greens.sh", privileged: false, args: shared_dir

end
