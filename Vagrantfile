ports = {
  "mail" => [25, 465, 993],
  "nas"  => [80, 443, 4040, 8112]
}

Vagrant::Config.run do |config|
  config.vm.box = "ubuntu-precise"
  Dir["./chef/roles/*"].map { |file| File.basename(file, ".rb") }.each do |role|
    config.vm.define role do |node|
      node.vm.host_name = "#{role}.localdomain"
      ports[role].each { |port| node.vm.forward_port port, port + 30000 } if ports.has_key?(role)
      node.vm.provision :chef_solo do |chef|
        chef.cookbooks_path = "chef/cookbooks"
        chef.roles_path     = "chef/roles"
        chef.add_role role
      end
    end
  end
end
