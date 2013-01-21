#
# Cookbook Name:: users
# Recipe:: default
#
# Copyright 2012, Michael Paul Thomas Conigliaro
#
include_recipe "git", "github", "oh_my_zsh", "sublime"

data_bag("users").map { |obj| data_bag_item("users", obj) }.each do |u|
  user u["id"] do
    comment u["comment"]
    home u["homedir"]
    shell u["shell"] # FIXME: How do we change shell on OSX?
    supports :manage_home => true # FIXME: Why doesn't this work?
    only_if { node["users"]["manage"] }
  end

  u["groups"].each do |group|
    group group do
      members [u["id"]]
      append true
      only_if { node["users"]["manage"] }
    end
  end

  oh_my_zsh u["id"] do
    manage_zshrc u["oh_my_zsh"]["manage_zshrc"]
    theme u["oh_my_zsh"]["theme"]
    plugins u["oh_my_zsh"]["plugins"]
    only_if { u["shell"] =~ /zsh$/ }
  end

  git_config u["id"] do
    options u["git"]
    only_if { u["git"] }
  end

  github_sync u["github"]["local_dir"] do
    local_user u["id"]
    users u["github"]["users"]
    orgs u["github"]["orgs"]
    only_if { node["users"]["github_sync"] }
  end

  sublime u["id"] do
    options u["sublime"]
    only_if { u["sublime"] }
  end
end
