#
# Cookbook Name:: ubuntu
# Recipe:: grub
#
# Copyright 2012, Michael Paul Thomas Conigliaro
#
execute "update-grub" do
  command "update-grub"
  action :nothing
end

template "/etc/default/grub" do
  source "grub.default.erb"
  mode "0644"
  notifies :run, "execute[update-grub]", :immediately
end
