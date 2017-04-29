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
    # Decoders for improved attachment scanning
    'altermime',
    'arj',
    'binutils',
    'bzip2',
    'cabextract',
    'file',
    'gzip',
    'liblz4-tool',
    'lrzip',
    'lzop',
    'nomarch',
    'p7zip-full',
    'pax',
    'ripole',
    'rpm2cpio',
    'unrar-free',
    'xz-utils',
    'zoo'
  ]
  notifies :restart, 'service[amavis]'
end

template '/etc/clamav/clamd.conf' do
  mode '0644'
  notifies :restart, 'service[clamav-daemon]'
  notifies :restart, 'service[amavis]' # FIXME: Needed?
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
