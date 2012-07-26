#
# Cookbook Name:: mutt
# Recipe:: default
#
# Copyright 2011, Michael Paul Thomas Conigliaro
#
package 'mutt'

cookbook_file '/etc/Muttrc.d/maildir.rc' do
  source 'maildir.rc'
  mode "0644"
end
