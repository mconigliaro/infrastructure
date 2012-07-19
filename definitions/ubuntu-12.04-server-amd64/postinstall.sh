#!/usr/bin/env bash

set -ex

NODE_NAME=$1
CHEF_SERVER_URL="https://api.opscode.com/organizations/conigliaro"

function is_vagrant {
  dmidecode --type bios | grep VirtualBox
  return $?
}

# Update system
aptitude update
aptitude -y full-upgrade

if [[ is_vagrant ]]; then
  # Install VirtualBox guest additions
  VBOX_PREREQUISITES="linux-headers-$(uname -r) build-essential"
  VBOX_VERSION=$(cat /home/vagrant/.vbox_version)
  aptitude -y install $VBOX_PREREQUISITES
  cd /tmp
  wget http://download.virtualbox.org/virtualbox/$VBOX_VERSION/VBoxGuestAdditions_$VBOX_VERSION.iso
  mount -o loop VBoxGuestAdditions_$VBOX_VERSION.iso /mnt
  echo "yes" | sh /mnt/VBoxLinuxAdditions.run
  umount /mnt
  rm VBoxGuestAdditions_$VBOX_VERSION.iso
  lsmod | grep -q vboxguest
  aptitude -y purge $VBOX_PREREQUISITES

  # Install SSH key for Vagrant
  mkdir /home/vagrant/.ssh
  chmod 700 /home/vagrant/.ssh
  cd /home/vagrant/.ssh
  wget --no-check-certificate 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub' -O authorized_keys
  chmod 600 /home/vagrant/.ssh/authorized_keys
  chown -R vagrant /home/vagrant/.ssh

  # Set up passwordless sudo for Vagrant
  sed -i -e '/Defaults\s\+env_reset/a Defaults\texempt_group=sudo' /etc/sudoers
  sed -i -e 's/^%sudo.*$/%sudo ALL=NOPASSWD: ALL/' /etc/sudoers

  # Disable DNS lookups in sshd
  printf "\nUseDNS no" >> /etc/ssh/sshd_config
  service ssh restart
fi

# Install chef
echo "deb http://apt.opscode.com/ $(lsb_release -cs)-0.10 main" > /etc/apt/sources.list.d/opscode.list
wget -O - -q http://apt.opscode.com/packages@opscode.com.gpg.key | apt-key add -
aptitude update
echo "chef chef/chef_server_url string ${CHEF_SERVER_URL}" | debconf-set-selections
aptitude -y install chef

if [[ is_vagrant ]]; then
  # Disable Chef
  service chef-client stop
  update-rc.d chef-client disable

  # Remove downloaded packages
  aptitude clean

  # Zero out the free space to save space in the final image
  dd if=/dev/zero of=/EMPTY bs=1M || rm -f /EMPTY

  # Remove leftover leases and persistent rules
  rm /var/lib/dhcp/*

  # Make sure Udev doesn't block the network
  # http://6.ptmc.org/?p=164
  rm /etc/udev/rules.d/70-persistent-net.rules
  mkdir /etc/udev/rules.d/70-persistent-net.rules
  rm -rf /dev/.udev/

  # Add a 2 sec delay to the interface up, to make the dhclient happy"
  echo "pre-up sleep 2" >> /etc/network/interfaces
fi
