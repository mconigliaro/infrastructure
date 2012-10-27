#
# Cookbook Name:: github
# Provider:: sync
#
# Copyright 2012, Michael Paul Thomas Conigliaro
#
action :create do
  root_dir = ::File.join(homedir(new_resource.local_user), new_resource.name)

  directory root_dir do
    mode "0755"
    owner new_resource.local_user
    recursive true
  end

  ["users", "orgs"].each do |type|
    new_resource.send(type).each do |id|
      directory ::File.join(root_dir, id) do
        mode "0755"
        owner new_resource.local_user
      end
      ::JSON.parse(`curl -s https://api.github.com/#{type}/#{id}/repos`).each do |repo|
        git ::File.join(root_dir, id, repo["name"]) do
          repository repo["git_url"]
          user new_resource.local_user
        end
      end
    end
  end
end

action :remove do
  # FIXME
end
