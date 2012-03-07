#
# Cookbook Name:: mail-server
# Recipe:: default
#
# Copyright 2011, Michael Paul Thomas Conigliaro
#
template "/etc/mailname" do
  source "mailname.erb"
  mode "0644"
  notifies :restart, "service[postfix]"
end

# FIXME: https://bugs.launchpad.net/ubuntu/+source/amavisd-new/+bug/930916
%w{
  dovecot-pop3d
  dovecot-imapd
  dovecot-sieve
  postfix
  amavisd-new-postfix
  postgrey
}.each { |p| package p }

group "amavis" do
  members ["clamav"]
  append true
end

%w{
  dovecot
  postfix
  amavis
  spamassassin
  postgrey
}.each do |s|
  service s do
    action :enable
  end
end

%w{
  10-mail.conf
  10-master.conf
  20-imap.conf
}.each do |f|
  template "/etc/dovecot/conf.d/#{f}" do
    source "#{f}.erb"
    mode "0644"
    notifies :restart, "service[dovecot]"
  end
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
    notifies :run, "execute[postmap_#{db}]"
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

template "/etc/default/spamassassin" do
  source "spamassassin.default.erb"
  mode "0644"
  notifies :restart, "service[spamassassin]"
end

template "/etc/amavis/conf.d/50-user" do
  source "50-user.erb"
  mode "0644"
  notifies :restart, "service[amavis]"
end

template "/etc/default/postgrey" do
  source "postgrey.default.erb"
  mode "0644"
  notifies :restart, "service[postgrey]"
end

template "/etc/monit/conf.d/mail-server.monit" do
  source "mail-server.monit.erb"
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

%w{
  .dovecot.sieve
}.each do |f|
  cookbook_file "/etc/skel/#{f}" do
    source f
    mode "0644"
  end
end
