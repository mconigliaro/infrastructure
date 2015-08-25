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
  mtr-tiny
  ngrep
  nethogs
  nmap
  psmisc
  strace
  sysv-rc-conf
  tcpdump
  telnet
  tmux
  tshark
  vim
).each { |p| package p }
