use_inline_resources

action :create do
  service 'monit' do
    action [:nothing]
  end

  template "/etc/monit/conf.d/#{new_resource.name}" do
    source "#{new_resource.name}.monit.erb"
    mode 00644
    notifies :restart, 'service[monit]'
  end
end

action :delete do
  service 'monit' do
    action [:nothing]
  end

  file "/etc/monit/conf.d/#{new_resource.name}" do
    action :delete
    notifies :restart, 'service[monit]'
  end
end
