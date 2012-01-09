#
# Cookbook Name:: base
# Recipe:: packages
#
# Copyright 2012, Michael Paul Thomas Conigliaro
#
%w{
  bsd-mailx
  git-core
  htop
  iftop
  iotop
  lsof
  mtr-tiny
  ngrep
  nethogs
  nmap
  psmisc
  strace
  sysstat
  sysv-rc-conf
  tcpdump
  telnet
  tmux
  tshark
  zip
}.each { |p| package p }