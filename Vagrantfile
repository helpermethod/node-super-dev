VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.provision :shell, privileged: false, path: "bootstrap.sh", args: ENV["SHELL_ARGS"]
  config.vm.network :forwarded_port, host: 8181, guest: 8080
end
