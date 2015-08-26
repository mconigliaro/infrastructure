ENV['HTTP_PROXY'] = ENV['KITCHEN_HTTP_PROXY']
ENV['HTTPS_PROXY'] = ENV['KITCHEN_HTTPS_PROXY']

Vagrant.configure(2) do |config|
  config.vm.box = 'opscode-ubuntu-14.04'

  if Vagrant.has_plugin?('vagrant-proxyconf')
    config.proxy.http = ENV['KITCHEN_HTTP_PROXY']
    config.proxy.https = ENV['KITCHEN_HTTPS_PROXY']
    config.proxy.no_proxy = 'localhost,127.0.0.1'
  end

  Dir['./roles/*.rb'].map { |file| File.basename(file, '.rb') }.each do |role|
    config.vm.define role do |node|
      node.vm.host_name = "#{role}.localdomain"
      node.vm.provision :chef_solo do |chef|
        chef.log_level = :info
        chef.cookbooks_path = 'cookbooks'
        chef.roles_path = 'roles'
        chef.environments_path = 'environments'
        chef.environment = 'development'
        chef.add_role role
      end
    end
  end
end
