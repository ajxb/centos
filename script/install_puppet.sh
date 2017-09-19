#!/bin/bash -eux

# Determine the relevant parameters in order to obtain the correct version of puppet
RELEASE=`rpm -q --qf "%{VERSION}" $(rpm -q --whatprovides redhat-release)`

# Get the puppet repo definition
echo "Installing https://yum.puppetlabs.com/puppetlabs-release-pc1-el-$RELEASE.noarch.rpm"
rpm -i --force https://yum.puppetlabs.com/puppetlabs-release-pc1-el-$RELEASE.noarch.rpm

# Install Puppet and Facter
echo "Installing Puppet"
yum -y install puppet-agent

echo "Installing ruby"
yum -y install centos-release-scl
yum -y install rh-ruby24

echo "Enabling ruby and installing librarian-puppet"
scl enable rh-ruby24 'gem install librarian-puppet'
