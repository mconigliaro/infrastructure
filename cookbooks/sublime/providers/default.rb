#
# Cookbook Name:: sublime
# Provider:: default
#
# Copyright 2012, Michael Paul Thomas Conigliaro
#
action :create do

  link ::File::SEPARATOR + ::File.join("usr", "local", "bin", "subl") do
    to ::File::SEPARATOR + ::File.join("Applications", "Sublime Text 2.app", "Contents", "SharedSupport", "bin", "subl")
  end

  config_root = value_for_platform(
    ["mac_os_x" ] => {
      "default" => ::File.join(homedir(new_resource.name), "Library", "Application Support", "Sublime Text 2")
    }
  ) || ::File.join(homedir(new_resource.name), ".config", "sublime-text-2")
  preferences_root = ::File.join(config_root, "Packages", "User")
  packages_root = ::File.join(config_root, "Installed Packages")

  file ::File.join(preferences_root, "Preferences.sublime-settings") do
    content new_resource.options["preferences"].to_json
    mode "0644"
    owner new_resource.name
    only_if { ::File.directory?(preferences_root) }
  end

  new_resource.options["packages"].each do |url|
    remote_file ::File.join(packages_root, url.split("/").last) do
      source url
      only_if { ::File.directory?(packages_root) }
    end
  end

end

action :remove do
  # FIXME
end
