name "nas"
description "NAS server"
run_list %w{
  role[server]
  recipe[ubuntu::grub]
  recipe[smartmontools]
  recipe[mdadm]
  recipe[apcupsd]
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
