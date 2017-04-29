#
# Cookbook Name:: mconigliaro_postfix
# Recipe:: amavis
#
# Copyright (c) 2017 Mike Conigliaro, All Rights Reserved.
package 'amavis' do
  package_name [
    'amavisd-new',
    'clamav-daemon',
    'opendkim',
    'postfix-policyd-spf-python',
    'spamassassin',
    # For improved spam detection
    'pyzor',
    'razor',
    # For improved attachment scanning
    'arj',
    'bzip2',
    'cabextract',
    'cpio',
    'file',
    'gzip',
    'lhasa',
    'nomarch',
    'pax',
    'rar',
    'unrar',
    'unzip',
    'zip',
    'zoo'
  ]
end

template '/etc/clamav/clamd.conf' do
  mode '0644'
  notifies :restart, 'service[clamav-daemon]'
  notifies :restart, 'service[amavis]'
end

group 'amavis' do
  members %w( clamav )
  append true
end

execute 'razor-admin -create' do
  environment lazy { { 'HOME' => Dir.home('amavis') } }
  user 'amavis'
  creates lazy { "#{Dir.home('amavis')}/.razor" }
end

execute 'razor-admin -register' do
  environment lazy { { 'HOME' => Dir.home('amavis') } }
  user 'amavis'
  creates lazy { "#{Dir.home('amavis')}/.razor/identity" }
end

execute 'pyzor discover' do
  environment lazy { { 'HOME' => Dir.home('amavis') } }
  user 'amavis'
  creates lazy { "#{Dir.home('amavis')}/.pyzor/servers" }
end

%w(
  /etc/spamassassin/local.cf
  /etc/spamassassin/v310.pre
  /etc/amavis/conf.d/50-user
).each do |obj|
  template obj do
    mode '0644'
    notifies :restart, 'service[amavis]'
  end
end

%w(amavis clamav-daemon clamav-freshclam).each do |obj|
  service obj do
    action [:start, :enable]
  end
end

mconigliaro_monit_service 'amavis'
