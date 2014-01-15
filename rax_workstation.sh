#!/bin/bash

#
# Install some needed packages
#
apt-get -y update
apt-get -y install curl build-essential libxml2-dev libxslt-dev git zlib1g-dev libssl-dev subversion

#
# Install easy_install, pip, and the openstack python libs, and ansible
#
curl https://pypi.python.org/packages/source/s/setuptools/setuptools-1.1.6.tar.gz | tar xvzf -;cd setuptools-1.1.6;python setup.py install
easy_install pip
pip install ipython
pip install python-novaclient
pip install python-swiftclient
pip install python-heatclient
pip install python-cinderclient
pip install python-keystoneclient
pip install python-troveclient
pip install python-neutronclient
pip install pyrax
pip install ansible
pip install supernova
git clone https://github.com/rackerlabs/python-cloudlb.git $HOME/cloudlb;cd $HOME/cloudlb;python setup.py install;cd $HOME
git clone https://github.com/jyidiego/clb.git $HOME/clb;cd $HOME/clb;python setup.py install;cd $HOME
chmod -R 544 /usr/local/lib/python2.7/dist-packages/python_dateutil-*-py2.7.egg/EGG-INFO/* # needed because perms are screwed.
rm -rf $HOME/clb $HOME/cloudlb

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
