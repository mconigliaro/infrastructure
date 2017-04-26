default['mconigliaro_aws']['configure_users'] = %w(root)

default['mconigliaro_aws']['aws_access_key_id'] = nil
default['mconigliaro_aws']['aws_secret_access_key'] = nil
default['mconigliaro_aws']['aws_default_region'] = node['ec2'] ? node['ec2']['placement_availability_zone'].chop : 'us-east-1'

default['mconigliaro_aws']['ec2_update_dns_args'] = [[]]
