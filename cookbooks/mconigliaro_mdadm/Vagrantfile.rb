Vagrant.configure('2') do |config|
  config.vm.provider 'virtualbox' do |vb|
    2.times do |n|
      vb.customize ['createhd', '--filename', "disk#{n + 1}.vdi", '--size', '64']
      vb.customize ['storageattach', :id, '--storagectl', 'IDE Controller', '--medium', "disk#{n + 1}.vdi", '--port', '1', '--device', n, '--type', 'hdd']
    end
  end
end
