#
# Cookbook Name:: mail
# Recipe:: server
#
# Copyright 2011, Michael Paul Thomas Conigliaro
#
%w{
  dovecot-pop3d
  dovecot-imapd
  dovecot-sieve
  amavisd-new-postfix
  pyzor
  razor
  arj
  cabextract
  cpio
  lha
  nomarch
  pax
  rar
  unrar
  unzip
  zip
  postgrey
}.each { |p| package p }

group "amavis" do
  members ["clamav"]
  append true
end

%w{
  dovecot
  amavis
  spamassassin
  postgrey
}.each do |s|
  service s do
    action :enable
  end
end

template "/etc/dovecot/conf.d/01-local.conf" do
  source "01-local.conf.erb"
  mode "0644"
  notifies :restart, "service[dovecot]"
end

template "/etc/default/spamassassin" do
  source "spamassassin.default.erb"
  mode "0644"
  notifies :restart, "service[spamassassin]"
end

%w{
  local.cf
  v310.pre
}.each do |f|
  template "/etc/spamassassin/#{f}" do
    source "#{f}.erb"
    mode "0644"
    notifies :restart, "service[spamassassin]"
  end
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

%w{
  .dovecot.sieve
}.each do |f|
  cookbook_file "/etc/skel/#{f}" do
    source f
    mode "0644"
  end
end
