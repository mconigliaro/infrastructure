#
# Cookbook Name:: homebrew
# Recipe:: default
#
# Copyright 2012, Michael Paul Thomas Conigliaro
#
if node["platform"] == "mac_os_x"
  execute "curl -sfL https://github.com/mxcl/homebrew/tarball/master | tar zx -m --strip 1" do
    cwd "/usr/local"
    not_if { File.exist?("/usr/local/bin/brew") }
  end

  include_recipe "git"

  execute "brew update"
end
