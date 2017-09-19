#!/bin/bash -eux

echo "==> Configuring yum"
# Disable fastestmirror plugin
sed -i "s/enabled=1/enabled=0/g" /etc/yum/pluginconf.d/fastestmirror.conf

# Set yum to only resolve IPv4 addresses
echo ip_resolve=4 >> /etc/yum.conf
