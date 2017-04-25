#
# Cookbook Name:: mconigliaro_ubuntu
# Recipe:: packages
#
# Copyright (c) 2015 Mike Conigliaro, All Rights Reserved.
package 'default_packages' do
  package_name %w(
    bsd-mailx
    chkrootkit
    curl
    debconf-utils
    ethtool
    htop
    iftop
    iotop
    iptraf
    lsof
    mosh
    moreutils
    mtr-tiny
    ngrep
    nethogs
    nmap
    psmisc
    silversearcher-ag
    strace
    sysv-rc-conf
    tcpdump
    telnet
    tmux
    tshark
    usbmount
    vim
  )
end
