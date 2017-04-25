#
# Cookbook Name:: mconigliaro_aws
# Recipe:: default
#
# Copyright (c) 2016 Mike Conigliaro, All Rights Reserved.
package 'awscli'
package 'jq'

if node['mconigliaro_aws'].values.any? { |obj| !obj.nil? }
  directory ::File.join(Dir.home('root'), '.aws') do
    mode '0755'
  end

  template ::File.join(Dir.home('root'), '.aws', 'config') do
    variables(
      aws_access_key_id: node['mconigliaro_aws']['aws_access_key_id'],
      aws_secret_access_key: node['mconigliaro_aws']['aws_secret_access_key'],
      region: node['mconigliaro_aws']['aws_default_region']
    )
    sensitive true
    mode '0600'
  end
else
  file ::File.join(Dir.home('root'), '.aws', 'config') do
    action :delete
  end

  directory ::File.join(Dir.home('root'), '.aws') do
    action :delete
  end
end
