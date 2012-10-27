start_port = 30000
ports = {
  "mail" => [25, 465, 993],
  "nas"  => [80, 443, 4040, 8112]
}

Vagrant::Config.run do |config|
  config.vm.box = "ubuntu-12.04-server-amd64"
  Dir["./roles/*"].map { |file| File.basename(file, ".rb") }.each do |role|
    config.vm.define role do |node|
      node.vm.host_name = "#{role}.localdomain"
      ports[role].each { |port| node.vm.forward_port port, start_port + port } if ports.has_key?(role)
      node.vm.provision :chef_solo do |chef|
        chef.log_level      = :info
        chef.cookbooks_path = "cookbooks"
        chef.roles_path     = "roles"
        chef.data_bags_path = "data_bags"
        chef.add_role role
      end
    end
  end
end
