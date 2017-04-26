actions :create, :delete
default_action :create

property :service_name, name_attribute: true

action :create do
  service 'avahi-daemon'

  template "/etc/avahi/services/#{new_resource.name}" do
    source "#{new_resource.name}.avahi.erb"
    mode '0644'
    notifies :restart, 'service[avahi-daemon]'
  end
end

action :delete do
  service 'avahi-daemon'

  file "/etc/avahi/services/#{new_resource.name}" do
    action :delete
    notifies :restart, 'service[avahi-daemon]'
  end
end
