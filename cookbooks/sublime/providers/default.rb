#
# Cookbook Name:: sublime
# Provider:: default
#
# Copyright 2012, Michael Paul Thomas Conigliaro
#
action :create do

  user_root = ::File.join(
    value_for_platform(
      ["mac_os_x" ] => {
        "default" => ::File.join(homedir(new_resource.name), "Library", "Application Support", "Sublime Text 2")
      }
    ) || ::File.join(homedir(new_resource.name), ".config", "sublime-text-2"),
  "Packages", "User")

  new_resource.options.each do |type,options|
    file ::File.join(user_root, "#{type}.sublime-settings") do
      content new_resource.options[type].to_json
      mode "0644"
      owner new_resource.name
      only_if { ::File.directory?(user_root) }
    end
  end
end

action :remove do
  # FIXME
end
