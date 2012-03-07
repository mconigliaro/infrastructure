set -ex

# Install VirtualBox guest additions
aptitude -y install linux-headers-$(uname -r) build-essential
VBOX_VERSION=$(cat /home/vagrant/.vbox_version)
cd /tmp
wget http://download.virtualbox.org/virtualbox/$VBOX_VERSION/VBoxGuestAdditions_$VBOX_VERSION.iso
mount -o loop VBoxGuestAdditions_$VBOX_VERSION.iso /mnt
sh /mnt/VBoxLinuxAdditions.run
umount /mnt
rm VBoxGuestAdditions_$VBOX_VERSION.iso
aptitude -y purge linux-headers-$(uname -r) build-essential

# Install Ruby 1.9
# aptitude -y install ruby1.9.2
# update-alternatives --set ruby /usr/bin/ruby1.9.1
# update-alternatives --set gem /usr/bin/gem1.9.1

# Install RVM and Ruby
aptitude -y install openssl libreadline6 libreadline6-dev curl git-core zlib1g \
  zlib1g-dev libssl-dev libyaml-dev libsqlite3-0 libsqlite3-dev sqlite3 \
  libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool \
  bison subversion
curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer | bash
PATH=$PATH:/usr/local/rvm/bin
rvm install ruby-1.9.3

# Install chef
# echo "deb http://apt.opscode.com/ `lsb_release -cs`-0.10 main" >> /etc/apt/sources.list.d/opscode.list
# wget -O - -q http://apt.opscode.com/packages@opscode.com.gpg.key | apt-key add -
# aptitude update
# echo "chef chef/chef_server_url string" | debconf-set-selections
# aptitude -y install ohai chef
# update-rc.d chef-client disable
# service chef-client stop
source /etc/profile.d/rvm.sh
rvm --default use 1.9.3
gem install chef

# Remove downloaded packages
aptitude clean

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
