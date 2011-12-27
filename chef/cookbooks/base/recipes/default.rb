#
# Cookbook Name:: base
# Recipe:: default
#
# Copyright 2011, Michael Paul Thomas Conigliaro
#
[ 'bsd-mailx',
  'git-core',
  'htop',
  'iftop',
  'iotop',
  'lsof',
  'mtr-tiny',
  'ngrep',
  'nethogs',
  'nmap',
  'psmisc',
  'strace',
  'sysv-rc-conf',
  'tcpdump',
  'telnet',
  'tmux',
  'tshark',
  'zip'].each do |p|
    package p do
      package_name p
    end
end
