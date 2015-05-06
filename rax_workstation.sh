#!/bin/bash

#
# Install some needed packages
#
apt-get -y update
apt-get -y install curl build-essential libxml2-dev libxslt-dev git zlib1g-dev libssl-dev subversion

apt-get -y install linux-headers-generic
apt-get -y install python openssh-server python-dev software-properties-common ipython

#
# Install easy_install, pip, and the openstack python libs, and ansible
#
curl https://pypi.python.org/packages/source/s/setuptools/setuptools-1.1.6.tar.gz | tar xvzf -;cd setuptools-1.1.6;python setup.py install
easy_install pip
pip install rackspace-novaclient
pip install swiftly
pip install python-heatclient
pip install python-keystoneclient
pip install python-troveclient
pip install rackspace-neutronclient
pip install pyrax
pip install ansible
pip install supernova
pip install rackspace-monitoring-cli

#
# install lava client
#
curl -L http://bit.ly/cbdclient | tar xvzf -;cd python-lava*;python setup.py install;cd $HOME

cat <<EOF > /etc/motd.tail
 Rackspace Public Cloud/Openstack Automation Platform

 This platform comes with the following Openstack SDKs
 and command line utilities:

 Version Control Tools: git, subversion
 Automation Tools: ansible
 Python: pyrax, nova, swift, clb, heat, keystone, cinder, neutron, and trove

 RUN THIS COMMAND TO START: source openstackrc.sh
EOF

cp /vagrant/openstackrc.sh /root/openstackrc.sh
cp /vagrant/.openstack_cli_functions.sh /root/.openstack_cli_functions.sh
