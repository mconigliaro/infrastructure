Veewee::Session.declare({
  :boot_cmd_sequence => %w{
    <Esc>
    <Esc>
    <Enter>
    /install/vmlinuz
    auto
    console-setup/ask_detect=false
    debconf/frontend=noninteractive
    debian-installer=en_US
    domain=vagrantup.com
    fb=false
    hostname=%NAME%
    initrd=/install/initrd.gz
    kbd-chooser/method=us
    keyboard-configuration/layout=USA
    keyboard-configuration/variant=USA
    locale=en_US
    noapic
    preseed/url=http://%IP%:%PORT%/preseed.cfg
    --
    <Enter>
  }.map { |obj| "#{obj} " },
  :boot_wait => "10",
  :cpu_count => "1",
  :disk_format => "VDI",
  :disk_size => "40960",
  :hostiocache => "off",
  :iso_download_timeout => "1000",
  :iso_file => "ubuntu-12.04.1-server-amd64.iso",
  :iso_md5 => "a8c667e871f48f3a662f3fbf1c3ddb17",
  :iso_src => "http://releases.ubuntu.com/precise/ubuntu-12.04.1-server-amd64.iso",
  :kickstart_file => "preseed.cfg",
  :kickstart_port => "7122",
  :kickstart_timeout => "10000",
  :memory_size=> "384",
  :os_type_id => 'Ubuntu_64',
  :postinstall_files => [ "postinstall.sh" ],
  :postinstall_timeout => "10000",
  :shutdown_cmd => "shutdown -P now",
  :ssh_guest_port => "22",
  :ssh_host_port => "7222",
  :ssh_key => "",
  :ssh_login_timeout => "10000",
  :ssh_password => "vagrant",
  :ssh_user => "vagrant",
  :sudo_cmd => "echo '%p' | sudo -S bash '%f' && rm %f",
  :virtualbox => {
    :vm_options => {
      :ioapic => "on",
      :pae => "on"
    }
  }
})
