#
# Cookbook Name:: samba
# Provider:: user
#
# Copyright 2012, Michael Paul Thomas Conigliaro
#
action :create do
  if new_resource.password.nil?
    execute "smbpasswd -a -n #{new_resource.username}"
  else
    execute "echo -n '#{(new_resource.password + '\n') * 2}' | smbpasswd -a -s #{new_resource.username}"
  end
end

action :remove do
  execute "smbpasswd -x #{new_resource.username}" do
    only_if "pdbedit -u #{new_resource.username}"
  end
end
