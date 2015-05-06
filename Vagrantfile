#
# If you need to spin up a CentOS server please refer to
# https://github.com/dr-strangecode/vagrant-centos-rackspace-workaround
# essentially you need to create a custom image for each DC where
# you comment out:
# Defaults requiretty
# Defaults !visiblepw
# in /etc/sudoers with the visudo
#

Vagrant.configure("2") do |config|
  config.vm.box = "dummy"
  config.ssh.private_key_path = "~/.ssh/id_rsa" # private ssh key to ssh into created server
  # config.ssh.pty = true
  config.vm.synced_folder ".", "/vagrant", type: "rsync"
  config.vm.provision "shell", path: "rax_workstation.sh"
  config.vm.provider :rackspace do |rs|
    rs.username = ENV['RAX_USERNAME']
    rs.api_key  = ENV['RAX_API_KEY']
    rs.key_name = ENV['RAX_SSH_KEYNAME']
    rs.flavor   = /1 GB Performance/
    rs.image    = "Ubuntu 15.04 (Vivid Vervet) (PVHVM)"
    rs.server_name = "rax_workstation_#{Time.now.strftime("%Y%m%d-%H%M%S")}"
    # rs.public_key_path = "~/.ssh/id_rsa.pub" # register public ssh key using nova
    rs.rackspace_region = :iad
    rs.rackconnect = false
    # rs.networks = [ '84977776-7079-495c-a0da-6a2915c81989', When adding another network
    rs.networks = [ '00000000-0000-0000-0000-000000000000', #Public
                    '11111111-1111-1111-1111-111111111111' ]  #ServiceNet
  end
end
