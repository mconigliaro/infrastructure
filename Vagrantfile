ENV['HTTP_PROXY'] = ENV['VAGRANT_HTTP_PROXY']
ENV['HTTPS_PROXY'] = ENV['VAGRANT_HTTPS_PROXY']

Vagrant.configure(2) do |config|
  config.vm.provider 'virtualbox' do |v|
    v.memory = 1024
  end

  config.vm.box = 'opscode-ubuntu-14.04'

  if Vagrant.has_plugin?('vagrant-proxyconf')
    config.proxy.http = ENV['VAGRANT_HTTP_PROXY']
    config.proxy.https = ENV['VAGRANT_HTTPS_PROXY']
    config.proxy.no_proxy = 'localhost,127.0.0.1'
  end

  Dir['./roles/*.rb'].map { |file| File.basename(file, '.rb') }.each do |role|
    config.vm.define role do |node|
      node.vm.host_name = "#{role}.localdomain"
      node.vm.provision :chef_solo do |chef|
        chef.log_level = :info
        chef.cookbooks_path = 'cookbooks'
        chef.roles_path = 'roles'
        chef.add_role role
        json = "./json_attributes/#{role}.json"
        chef.json = JSON.parse(IO.read(json)) if File.exist?(json)
      end
    end
  end
end
