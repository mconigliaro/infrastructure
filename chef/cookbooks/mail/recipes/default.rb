#
# Cookbook Name:: mail
# Recipe:: default
#
# Copyright 2011, Michael Paul Thomas Conigliaro
#
template "/etc/mailname" do
  source "mailname.erb"
  mode "0644"
  notifies :restart, "service[postfix]"
end

package "postfix"

service "postfix" do
  action :enable
end

%w{
  access_client
  access_sender
  generic
  sasl_password
  virtual
}.each do |db|
  execute "postmap_#{db}" do
    command "/usr/sbin/postmap /etc/postfix/#{db}"
    action :nothing
  end

  template "/etc/postfix/#{db}" do
    source "#{db}.erb"
    mode "0644"
    notifies :run, "execute[postmap_#{db}]", :immediately
  end
end

%w{
  master.cf
  main.cf
}.each do |f|
  template "/etc/postfix/#{f}" do
    source "#{f}.erb"
    mode "0644"
    notifies :restart, "service[postfix]"
  end
end

template "/etc/monit/conf.d/mail.monit" do
  source "mail.monit.erb"
  mode "0644"
  notifies :restart, "service[monit]"
end

execute "newaliases" do
  command "/usr/bin/newaliases"
  action :nothing
end

template "/etc/aliases" do
  source "aliases.erb"
  mode "0644"
  notifies :run, "execute[newaliases]", :immediately
end
