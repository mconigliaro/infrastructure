#
# Cookbook Name:: mconigliaro_mutt
# Recipe:: default
#
# Copyright (c) 2015 Mike Conigliaro, All Rights Reserved.
package 'mutt'

template '/etc/Muttrc.d/maildir.rc' do
  mode '0644'
end
