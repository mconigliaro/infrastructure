#
# Cookbook Name:: oh_my_zsh
# Provider:: default
#
# Copyright 2012, Michael Paul Thomas Conigliaro
#
action :create do
  package "zsh"

  install_dir = new_resource.system_install ? "/opt/oh-my-zsh" : "#{new_resource.homedir}/.oh-my-zsh"

  git install_dir do
    repository "git://github.com/robbyrussell/oh-my-zsh.git"
    user new_resource.user unless new_resource.system_install
    group new_resource.group unless new_resource.system_install
  end

  template "#{new_resource.homedir}/.zshrc" do
    variables({
      :system_install => new_resource.system_install,
      :install_dir    => install_dir
    })
    cookbook "oh_my_zsh"
    source ".zshrc.erb"
    mode "0644"
    owner new_resource.user
    group new_resource.group
    only_if { !::File.exist?("#{new_resource.homedir}/.zshrc") || new_resource.manage_zshrc }
  end
end

action :remove do
  package "zsh" do
    action :remove
  end

  execute "rm -rf #{install_dir}" do
    only_if { ::File.directory?(install_dir) && !new_resource.system_install }
  end

  execute "rm #{new_resource.homedir}/.zshrc" do
    only_if { ::File.exist?("#{new_resource.homedir}/.zshrc") && new_resource.manage_zshrc }
  end
end
