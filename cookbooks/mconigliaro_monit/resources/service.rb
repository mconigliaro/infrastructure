actions :create, :delete
default_action :create

attribute :service_name, name_attribute: true
attribute :variables, kind_of: Hash
