#
# Cookbook Name:: mconigliaro_ubuntu
# Recipe:: grub
#
# Copyright (c) 2015 Mike Conigliaro, All Rights Reserved.
execute 'update-grub' do
  command 'update-grub'
  action :nothing
end

template '/etc/default/grub' do
  mode 00644
  notifies :run, 'execute[update-grub]', :immediately
end
