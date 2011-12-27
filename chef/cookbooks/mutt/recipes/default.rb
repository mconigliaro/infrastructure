#
# Cookbook Name:: mutt
# Recipe:: default
#
# Copyright 2011, Michael Paul Thomas Conigliaro
#
package 'mutt' do
  package_name 'mutt'
end

cookbook_file 'maildir.rc' do
  source 'maildir.rc'
  path '/etc/Muttrc.d/maildir.rc'
  mode "0644"
end
