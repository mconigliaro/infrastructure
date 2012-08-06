#
# Cookbook Name:: mail
# Recipe:: default
#
# Copyright 2011, Michael Paul Thomas Conigliaro
#
package "postfix"

service "postfix" do
  action :enable
end

file "/etc/mailname" do
  content node["fqdn"]
  mode "0644"
  notifies :restart, "service[postfix]"
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

%w{
  access_client
  access_sender
  generic
  sasl_password
  virtual
}.each do |db|
  file "/etc/postfix/#{db}" do
    content node["mail"]["postfix"]["maps"][db.to_sym].join("\n")
    mode "0644"
  end

  execute "/usr/sbin/postmap /etc/postfix/#{db}" do
    only_if { File.mtime("/etc/postfix/#{db}.db").to_i < File.mtime("/etc/postfix/#{db}").to_i }
  end
end

template "/etc/aliases" do
  source "aliases.erb"
  mode "0644"
end

execute "/usr/bin/newaliases" do
  only_if { File.mtime("/etc/aliases.db").to_i < File.mtime("/etc/aliases").to_i }
end

template "/etc/monit/conf.d/mail.monit" do
  source "mail.monit.erb"
  mode "0644"
  notifies :restart, "service[monit]"
end
