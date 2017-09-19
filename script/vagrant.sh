#!/bin/bash -eux

echo '==> Configuring settings for vagrant'

VAGRANT_USER=vagrant
VAGRANT_HOME=/home/${VAGRANT_USER}

# Add vagrant user (if it doesn't already exist)
if ! id -u ${VAGRANT_USER} >/dev/null 2>&1; then
  echo '==> Creating ${VAGRANT_USER}'
  /usr/sbin/groupadd ${VAGRANT_USER}
  /usr/sbin/useradd ${VAGRANT_USER} -g ${VAGRANT_USER} -G wheel
  echo "${VAGRANT_USER}"|passwd --stdin ${VAGRANT_USER}
fi

echo '==> Installing Vagrant SSH key'
mkdir -pm 700 ${VAGRANT_HOME}/.ssh
# https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub
wget --no-check-certificate 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub' -O ${VAGRANT_HOME}/.ssh/authorized_keys
chmod 0600 ${VAGRANT_HOME}/.ssh/authorized_keys
chown -R ${VAGRANT_USER}:${VAGRANT_USER} ${VAGRANT_HOME}/.ssh
