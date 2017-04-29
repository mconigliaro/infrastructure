Vagrant.configure('2') do |config|
  config.vm.provider 'virtualbox' do |vb|
    [1, 2].each_with_index do |disk_id, index|
      disk_file = "disk#{disk_id}.vdi"
      vb.customize ['createhd', '--filename', disk_file, '--size', '1024'] unless File.exist?(disk_file)
      vb.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--medium', disk_file, '--port', index + 1, '--type', 'hdd']
    end
  end
end
