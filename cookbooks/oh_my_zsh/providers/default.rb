#
# Cookbook Name:: oh_my_zsh
# Provider:: default
#
# Copyright 2012, Michael Paul Thomas Conigliaro
#
action :create do
  package "zsh"

  system_install = false
  install_dir = if ::File.writable?("/opt/oh-my-zsh")
    system_install = true
    "/opt/oh-my-zsh"
  else
    ::File.join(homedir(new_resource.user), ".oh-my-zsh")
  end

  git install_dir do
    repository "git://github.com/robbyrussell/oh-my-zsh.git"
    user new_resource.user unless system_install
  end

  template ::File.join(homedir(new_resource.user), ".zshrc") do
    variables({
      :system_install => system_install,
      :install_dir    => install_dir,
      :theme          => new_resource.theme,
      :plugins        => new_resource.plugins,
      :zsh_options    => new_resource.zsh_options
    })
    cookbook "oh_my_zsh"
    source ".zshrc.erb"
    mode "0644"
    owner new_resource.user
    only_if { ::File.directory?(homedir(new_resource.user)) && new_resource.manage_zshrc }
  end
end

action :remove do
  package "zsh" do
    action :remove
  end

  execute "rm -rf #{install_dir}" do
    only_if { ::File.directory?(install_dir) && !system_install }
  end

  file ::File.join(homedir(new_resource.user), ".zshrc") do
    action :delete
    only_if { new_resource.manage_zshrc }
  end
end
