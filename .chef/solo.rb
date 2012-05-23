file_cache_path  "/tmp/chef-solo"
cache_options({ :path => "/tmp/chef-solo" })
file_backup_path "/tmp/chef-solo"
cookbook_path    File.expand_path(File.join(File.dirname(__FILE__), "..", "chef", "cookbooks"))
role_path        File.expand_path(File.join(File.dirname(__FILE__), "..", "chef", "roles"))
verbose_logging  false
