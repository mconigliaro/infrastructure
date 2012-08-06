log_level                :info
log_location             STDOUT
node_name                "mconigliaro"
client_key               "#{File.dirname(__FILE__)}/../certificates/chef-mconigliaro.pem"
validation_client_name   "conigliaro-validator"
validation_key           "#{File.dirname(__FILE__)}/../certificates/chef-conigliaro-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/conigliaro"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{File.dirname(__FILE__)}/../cookbooks"]
roles_path               ["#{File.dirname(__FILE__)}/../roles"]
cookbook_copyright       "Michael Paul Thomas Conigliaro"
cookbook_license         "MIT"
cookbook_email           "mike [at] conigliaro [dot] org"
