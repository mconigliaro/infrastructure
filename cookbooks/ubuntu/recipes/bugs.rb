#
# Cookbook Name:: ubuntu
# Recipe:: bugs
#
# Copyright 2012, Michael Paul Thomas Conigliaro
#

# FIXME: https://bugs.launchpad.net/ubuntu/+source/upstart/+bug/990102
directory "/var/log/upstart"

# FIXME: https://bugs.launchpad.net/ubuntu/+source/popularity-contest/+bug/707311
file "/etc/popularity-contest.conf" do
  content ""
  not_if { File.exists?("/etc/popularity-contest.conf") }
end
