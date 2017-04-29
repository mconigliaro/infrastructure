actions :create, :delete
default_action :create

property :service_name, name_attribute: true
property :source
property :variables, kind_of: Hash

action :create do
  service 'monit'

  template "/etc/monit/conf.d/#{new_resource.name}" do
    source new_resource.source || "#{new_resource.name}.monit.erb"
    variables new_resource.variables
    mode '0644'
    notifies :restart, 'service[monit]'
  end
end

action :delete do
  service 'monit'

  file "/etc/monit/conf.d/#{new_resource.name}" do
    action :delete
    notifies :restart, 'service[monit]'
  end
end
