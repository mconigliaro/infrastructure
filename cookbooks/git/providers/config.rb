#
# Cookbook Name:: git
# Provider:: config
#
# Copyright 2012, Michael Paul Thomas Conigliaro
#
action :create do
  file ::File.join(homedir(new_resource.name), ".gitconfig") do
    content new_resource.options.inject("") { |config,(section,pairs)|
      config + "[#{section}]\n" + pairs.inject([]) { |memo,(k,v)|
        memo + ["  #{k} = #{v}"]
      }.join("\n") + "\n"
    }
    mode "0644"
    owner new_resource.name
  end
end

action :remove do
  # FIXME
end
