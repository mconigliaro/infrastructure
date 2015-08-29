#
# Cookbook Name:: mconigliaro_postfix
# Recipe:: amavis
#
# Copyright (c) 2015 Mike Conigliaro, All Rights Reserved.
%w(amavisd-new spamassassin clamav-daemon opendkim postfix-policyd-spf-python).each do |obj|
  package obj
end

# For improved spam detection
%w(pyzor razor).each do |obj|
  package obj
end

# For improved attachment scanning
%w(arj bzip2 cabextract cpio file gzip lhasa nomarch pax rar unrar unzip zip zoo).each do |obj|
  package obj
end

group 'amavis' do
  members %w( clamav )
  append true
end

execute 'razor-admin -create' do
  environment 'HOME' => Dir.home('amavis')
  user 'amavis'
  creates "#{Dir.home('amavis')}/.razor"
end

execute 'razor-admin -register' do
  environment 'HOME' => Dir.home('amavis')
  user 'amavis'
  creates "#{Dir.home('amavis')}/.razor/identity"
end

execute 'pyzor discover' do
  environment 'HOME' => Dir.home('amavis')
  user 'amavis'
  creates "#{Dir.home('amavis')}/.pyzor/servers"
end

%w(
  /etc/spamassassin/local.cf
  /etc/spamassassin/v310.pre
  /etc/amavis/conf.d/50-user
).each do |obj|
  template obj do
    mode 00644
    notifies :restart, 'service[amavis]'
  end
end

%w(amavis clamav-daemon clamav-freshclam).each do |obj|
  service obj do
    action [:start, :enable]
  end
end

mconigliaro_monit_service 'amavis'
