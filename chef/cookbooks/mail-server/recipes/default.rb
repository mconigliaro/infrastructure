#
# Cookbook Name:: mail-server
# Recipe:: default
#
# Copyright 2011, Michael Paul Thomas Conigliaro
#

['mail-stack-delivery', 'amavisd-new-postfix', 'mutt'].each do |p|
  package p do
    package_name p
  end
end

group 'amavis' do
  members ['clamav']
  append true
end

['dovecot', 'postfix', 'amavis', 'spamassassin'].each do |s|
  service s do
    service_name s
    action :enable
  end
end

['access_client', 'access_sender', 'generic', 'sasl_password', 'virtual'].each do |db|
  execute "postmap_#{db}" do
    command "/usr/sbin/postmap /etc/postfix/#{db}"
    action :nothing
  end

  template db do
    source "#{db}.erb"
    path "/etc/postfix/#{db}"
    mode "0644"
    notifies :run, resources(:execute => "postmap_#{db}")
  end
end

template "main.cf" do
  source "main.cf.erb"
  path "/etc/postfix/main.cf"
  mode "0644"
  notifies :restart, resources(:service => "postfix")
end

template "spamassassin.default" do
  source "spamassassin.default.erb"
  path "/etc/default/spamassassin"
  mode "0644"
  notifies :restart, resources(:service => "spamassassin")
end

template "50-user" do
  source "50-user.erb"
  path "/etc/amavis/conf.d/50-user"
  mode "0644"
  notifies :restart, resources(:service => "amavis")
end

template "mail-server.monit" do
  source "mail-server.monit.erb"
  path "/etc/monit/conf.d/mail-server.monit"
  mode "0644"
  notifies :restart, resources(:service => "monit")
end

['.dovecot.sieve', '.muttrc'].each do |f|
  cookbook_file f do
    source f
    path "/etc/skel/#{f}"
    mode "0644"
  end
end
