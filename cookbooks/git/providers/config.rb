#
# Cookbook Name:: git
# Provider:: config
#
# Copyright 2012, Michael Paul Thomas Conigliaro
#
action :create do
  file ::File.join(homedir(new_resource.name), ".gitconfig") do
    content hash2gitconfig(new_resource.options)
    mode "0644"
    owner new_resource.name
  end
end

action :remove do
  # FIXME
end
