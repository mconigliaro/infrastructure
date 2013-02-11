ENV['CHEF_ENVIRONMENT'] ||= 'development'

def parse_json(path)
  JSON.parse(File.open(path) { |f| f.read }, :create_additions => false)
end

chef_env_conf = parse_json("./environments/#{ENV['CHEF_ENVIRONMENT']}.json")
Vagrant::Config.run do |config|
  config.vm.box = "ubuntu-12-04"
  Dir["./roles/*"].map { |file| File.basename(file, ".json") }.each do |role|
    chef_role_conf = parse_json("./roles/#{role}.json")
    chef_role_conf["vagrant"] ||= {}
    config.vm.define role do |node|
      node.vm.host_name = "#{role}.localdomain"
      if chef_role_conf["vagrant"]["forward_port"].respond_to?(:each)
        chef_role_conf["vagrant"]["forward_port"].each { |a,b| node.vm.forward_port a.to_i, b.to_i }
      end
      node.vm.provision :chef_solo do |chef|
        chef.log_level      = :info
        chef.cookbooks_path = "cookbooks"
        chef.roles_path     = "roles"
        chef.data_bags_path = "data_bags"
        chef.add_role role
        chef.json = chef_env_conf["override_attributes"]
      end
    end
  end
end
