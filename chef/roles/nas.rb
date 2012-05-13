name "nas"
description "NAS server"
run_list %w{
  role[server]
  recipe[ubuntu::grub]
  recipe[smartmontools]
  recipe[mdadm]
  recipe[apcupsd]
  recipe[nfs]
  recipe[avahi]
  recipe[netatalk]
  recipe[cups]
  recipe[samba]
  recipe[backuppc::server]
  recipe[deluge]
  recipe[subsonic]
  recipe[minidlna]
}
