#
# Cookbook Name:: mconigliaro_users
# Recipe:: default
#
# Copyright (c) 2015 Mike Conigliaro, All Rights Reserved.
include_recipe 'mconigliaro_zsh'

user 'mike' do
  comment 'Mike Conigliaro'
  home "#{node['mconigliaro_users']['home_root']}/mike"
  shell '/bin/zsh'
end

directory "#{node['mconigliaro_users']['home_root']}/mike" do
  owner 'mike'
  group 'mike'
  mode '0755'
end

%w(sudo fuse).each do |obj|
  group obj do
    members %w(mike)
    append true
    action :manage
  end
end

mconigliaro_zsh_oh_my_zsh 'mike' do
  theme 'gentoo'
end

directory "#{node['mconigliaro_users']['home_root']}/mike/.ssh" do
  owner 'mike'
  group 'mike'
  mode '0700'
end

file "#{node['mconigliaro_users']['home_root']}/mike/.ssh/authorized_keys" do
  content [
    'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC2h1LDWTcKTAGGky45old7S+O+iKAgcz9sUGTEKnWrOp0Rtia+UG2FXWpvFWdfbM7j8jiPWZy4kqmOoPAj6E51E2B6w4G1JGXIghaUGF4DF9oFi+iim7ToTGUDIdsrpx8e/ZfWxbqP7UWqMniU6GihUW5nVZxfMcVi5N50TVaFkR4P3gw6Gf4xElZ3nDMSRzRpUJxiUpQyrno1tkGE+EQYvtPSgKFyDpEhShc/ym0RT75lxvLHWuzJfIinE3ub93YtNj0Xt0kldRULXCsyPsv5doclZiZ+Vaa0gK97i4zfWWI6pjMuvHd8oP8Nhm3eI8VD4C1P1woGZQI//QQ8JfjH mike@conigliaro.org',
    'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCuxHx4QdgBkj1JgDm5/BAjI3Agc4wf/OgSb6IxQAKg64mINJcfv0BO5YXkKx9aJxkvREcE37rphwI4d39NGplzcB/o3wElN9dr3yWBfl33K/V/nszCfJmduMvCzqHZe05e5U6IQCbh7KVESRDTzdfVYHttgN++J/Xr8R+gN9aj5HsIYYiwVp5EaCdmrvFBl3LiSRzElmcbo5zkvyUOV1NlLBbf9khU4gwQ5XNOpYD48EqV9KQTuVjxUrZ9rPRmkiKtMTdFq5mE77u0RPGtfp3caetNjR2v7Vb1/SShu05vqGXHNHv9s9YKF1vTFe8QcZJPFNSFcAoBY3n2PP8wvbyZ mike@nas' # For attic backups
  ].map { |obj| "#{obj}\n" }.join
  owner 'mike'
  group 'mike'
  mode '0600'
end

node['mconigliaro_users']['attic_backup'].each do |obj|
  cron "attic_backup_#{obj['host']}" do
    user obj['user']
    hour obj['hour']
    minute obj['minute']
    command "chronic /usr/local/bin/attic_backup #{obj['host']} #{obj['paths'].join(' ')}"
  end
end
