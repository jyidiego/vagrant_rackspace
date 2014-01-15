#
# If you need to spin up a CentOS server please refer to
# https://github.com/dr-strangecode/vagrant-centos-rackspace-workaround
# essentially you need to create a custom image for each DC where
# you comment out:
# Defaults requiretty
# Defaults !visiblepw
#

Vagrant.configure("2") do |config|
  config.vm.box = "dummy"
  config.ssh.private_key_path = "~/.ssh/id_rsa"
  config.vm.provision "shell", path: "rax_workstation.sh"
  config.vm.provider :rackspace do |rs|
    rs.username = ENV['RAX_USERNAME']
    rs.api_key  = ENV['RAX_API_KEY']
    rs.flavor   = /1 GB Performance/
    rs.image    = /Ubuntu 12.10/
    rs.server_name = "rax_vagrant_#{Time.now.strftime("%Y%m%d-%H%M%S")}"
    rs.public_key_path = "~/.ssh/id_rsa.pub"
    rs.rackspace_region = :iad
  end
end
