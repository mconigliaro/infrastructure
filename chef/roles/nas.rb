name "nas"
description "NAS server"

default_run_list = %w{
  role[server]
  recipe[ubuntu::grub]
  recipe[smartmontools]
  recipe[mdadm]
  recipe[bind]
  recipe[backuppc::server]
  recipe[avahi]
  recipe[netatalk]
  recipe[nfs]
  recipe[cups]
  recipe[deluge]
  recipe[subsonic]
  recipe[minidlna]
}

production_run_list = default_run_list + %w{
  recipe[apcupsd]
}

env_run_lists({
  "ec2"      => production_run_list,
  "home"     => production_run_list,
  "_default" => default_run_list
})
