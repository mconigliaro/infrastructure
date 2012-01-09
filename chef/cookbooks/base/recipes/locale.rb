#
# Cookbook Name:: base
# Recipe:: locale
#
# Copyright 2012, Michael Paul Thomas Conigliaro
#
template "/etc/default/locale" do
  source "locale.erb"
  mode "0644"
end
