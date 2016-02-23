#
# Cookbook Name:: mconigliaro_aws
# Recipe:: update_my_ip
#
# Copyright (c) 2016 Mike Conigliaro, All Rights Reserved.
include_recipe 'mconigliaro_aws::default'

package 'curl'

cookbook_file '/usr/local/bin/update_my_ip' do
  mode 00755
end

node['mconigliaro_aws']['update_my_ip'].each do |hosted_zone_id, records|
  records.each do |record|
    cron "update_my_ip_#{record}" do
      minute '*/5'
      command "/usr/local/bin/update_my_ip #{hosted_zone_id} #{record}"
    end
  end
end
