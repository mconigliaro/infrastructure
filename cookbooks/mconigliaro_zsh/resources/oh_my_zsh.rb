actions :install, :uninstall
default_action :install

attribute :user, name_attribute: true
attribute :theme, kind_of: String, default: 'robbyrussell'
