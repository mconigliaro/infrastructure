#
# Cookbook Name:: mconigliaro_aws
# Recipe:: ec2_update_dns
#
# Copyright (c) 2016 Mike Conigliaro, All Rights Reserved.
include_recipe 'mconigliaro_aws::default'

package 'curl'
package 'jq'

cookbook_file '/usr/local/bin/ec2_update_dns' do
  mode '0755'
end

node['mconigliaro_aws']['ec2_update_dns_args'].each do |args|
  args_string = args.join(' ')
  cron "ec2_update_dns #{args_string}" do
    minute '*/5'
    command "PATH=/usr/local/bin:$PATH /usr/local/bin/ec2_update_dns #{args_string}"
  end
end
