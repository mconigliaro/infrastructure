#
# Cookbook Name:: mconigliaro_users
# Recipe:: default
#
# Copyright (c) 2015 Mike Conigliaro, All Rights Reserved.
node['mconigliaro_users'].each do |user|
  user = user.to_h
  user['home'] ||= "/home/#{user['username']}"
  user['shell'] ||= '/bin/zsh'
  user['groups'] ||= []
  user['ssh_authorized_keys'] ||= []
  user['attic_backup'] ||= []

  using_zsh = user['shell'] =~ %r{/zsh$}
  include_recipe 'mconigliaro_zsh' if using_zsh

  user user['username'] do
    comment user['comment']
    home user['home']
    shell user['shell']
  end

  directory user['home'] do
    owner user['username']
    group user['username']
    mode '0755'
  end

  user['groups'].each do |obj|
    group obj do
      members [user['username']]
      append true
      action :manage
    end
  end

  mconigliaro_zsh_antigen user['username'] do
    theme user['antigen_theme'] unless user['antigen_theme'].nil?
    bundles user['antigen_bundles'] unless user['antigen_bundles'].nil?
    exports user['antigen_exports'] unless user['antigen_exports'].nil?
    only_if { using_zsh }
  end

  directory "#{user['home']}/.ssh" do
    owner user['username']
    group user['username']
    mode '0700'
  end

  file "#{user['home']}/.ssh/authorized_keys" do
    content user['ssh_authorized_keys'].map { |obj| "#{obj}\n" }.join
    owner user['username']
    group user['username']
    mode '0600'
  end

  user['attic_backup'].each do |obj|
    cron "attic_backup_#{obj['host']}" do
      user obj['user']
      hour obj['hour']
      minute obj['minute']
      command "chronic /usr/local/bin/attic_backup #{obj['host']} #{obj['paths'].join(' ')}"
    end
  end
end
