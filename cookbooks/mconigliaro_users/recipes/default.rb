#
# Cookbook Name:: mconigliaro_users
# Recipe:: default
#
# Copyright (c) 2015 Mike Conigliaro, All Rights Reserved.
include_recipe 'mconigliaro_zsh'

user 'mike' do
  comment 'Mike Conigliaro'
  home '/home/mike'
  shell '/bin/zsh'
  supports manage_home: true
end

group 'sudo' do
  members %w(mike)
  append true
end

mconigliaro_zsh_oh_my_zsh 'mike' do
  theme 'gentoo'
end

directory '/home/mike/.ssh' do
  owner 'mike'
  group 'mike'
  mode 00700
end

file '/home/mike/.ssh/authorized_keys' do
  content [
    'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC2h1LDWTcKTAGGky45old7S+O+iKAgcz9sUGTEKnWrOp0Rtia+UG2FXWpvFWdfbM7j8jiPWZy4kqmOoPAj6E51E2B6w4G1JGXIghaUGF4DF9oFi+iim7ToTGUDIdsrpx8e/ZfWxbqP7UWqMniU6GihUW5nVZxfMcVi5N50TVaFkR4P3gw6Gf4xElZ3nDMSRzRpUJxiUpQyrno1tkGE+EQYvtPSgKFyDpEhShc/ym0RT75lxvLHWuzJfIinE3ub93YtNj0Xt0kldRULXCsyPsv5doclZiZ+Vaa0gK97i4zfWWI6pjMuvHd8oP8Nhm3eI8VD4C1P1woGZQI//QQ8JfjH mike@Mikes-Mac-Pro.local'
  ].map { |obj| "#{obj}\n" }.join
  owner 'mike'
  group 'mike'
  mode 00600
end
