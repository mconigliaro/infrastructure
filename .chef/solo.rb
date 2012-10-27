log_level       :info
verbose_logging false
file_cache_path "#{ENV['HOME']}/.chef/cache"
file_backup_path "#{ENV['HOME']}/.chef/backup"
cache_type      "BasicFile"
cache_options({ :path => "#{ENV['HOME']}/.chef/cache/checksums", :skip_expires => true })
cookbook_path   File.expand_path(File.join(File.dirname(__FILE__), "..", "cookbooks"))
role_path       File.expand_path(File.join(File.dirname(__FILE__), "..", "roles"))
data_bag_path   File.expand_path(File.join(File.dirname(__FILE__), "..", "data_bags"))
