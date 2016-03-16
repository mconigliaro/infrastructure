#
# Cookbook Name:: mconigliaro_ubuntu
# Recipe:: packages
#
# Copyright (c) 2015 Mike Conigliaro, All Rights Reserved.
%w(
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
).each { |p| package p }
