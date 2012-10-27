#
# Cookbook Name:: users
# Recipe:: default
#
# Copyright 2012, Michael Paul Thomas Conigliaro
#
data_bag("users").map { |obj| data_bag_item("users", obj) }.each do |user|
  user user["id"] do
    comment user["comment"]
    home user["homedir"]
    shell user["shell"]
    supports :manage_home => true # FIXME: Why doesn't this work?
    only_if { node["users"]["manage"] }
  end

  user["groups"].each do |group|
    group group do
      members [user["id"]]
      append true
      only_if { node["users"]["manage"] }
    end
  end

  oh_my_zsh user["id"] do
    manage_zshrc user["oh_my_zsh"]["manage_zshrc"]
    theme user["oh_my_zsh"]["theme"]
    plugins user["oh_my_zsh"]["plugins"]
    only_if { user["shell"] =~ /zsh$/ }
  end

  github_sync user["github"]["local_dir"] do
    local_user user["id"]
    users user["github"]["users"]
    orgs user["github"]["orgs"]
    only_if { node["users"]["github_sync"] }
  end
end
