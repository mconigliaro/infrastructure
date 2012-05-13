#
# Cookbook Name:: ubuntu
# Recipe:: packages
#
# Copyright 2012, Michael Paul Thomas Conigliaro
#
%w{
  bsd-mailx
  chkrootkit
  curl
  debconf-utils
  ethtool
  git-core
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
}.each { |p| package p }
