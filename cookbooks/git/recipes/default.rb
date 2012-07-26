#
# Cookbook Name:: git
# Recipe:: default
#
# Copyright 2012, Michael Paul Thomas Conigliaro
#
package case node["platform"]
when "ubuntu"
  "git-core"
when "mac_os_x"
  "git"
end
