#!/bin/bash -eux

# Configures network to broadcast DHCP_HOSTNAME

echo
echo "***** network.sh *****"

# Remove any existing DHCP_HOSTNAME configuration
sed -i "s/DHCP_HOSTNAME=.*//g" /etc/sysconfig/network

# Add in the correct DHCP_HOSTNAME configuration
echo 'DHCP_HOSTNAME=`hostname`' >> /etc/sysconfig/network

# Restart the network service to pick up the new configuration
service network restart

echo "***** network.sh done *****"
