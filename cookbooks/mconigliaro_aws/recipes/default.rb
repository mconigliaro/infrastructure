#
# Cookbook Name:: mconigliaro_aws
# Recipe:: default
#
# Copyright (c) 2016 Mike Conigliaro, All Rights Reserved.
package 'awscli' do
  action :purge
end

package 'python-pip'

execute 'pip install awscli' do
  creates '/usr/local/bin/aws'
end

node['mconigliaro_aws']['configure_users'].each do |user|
  directory '~/.aws' do
    path "#{Dir.home(user)}/.aws"
    owner user
    group user
    mode '0755'
  end

  template '~/.aws/config' do
    path "#{Dir.home(user)}/.aws/config"
    variables(
      region: node['mconigliaro_aws']['aws_default_region']
    )
    owner user
    group user
    mode '0600'
  end

  template '~/.aws/credentials' do
    path "#{Dir.home(user)}/.aws/credentials"
    variables(
      aws_access_key_id: node['mconigliaro_aws']['aws_access_key_id'],
      aws_secret_access_key: node['mconigliaro_aws']['aws_secret_access_key']
    )
    owner user
    group user
    mode '0600'
    sensitive true
  end
end
