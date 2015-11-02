VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.provision :shell, privileged: false, path: "bootstrap.sh", args: ENV["SHELL_ARGS"]
  config.vm.network :forwarded_port, host: 3000, guest: 3000
  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
  end
end
