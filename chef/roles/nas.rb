name "nas"
description "NAS server"
run_list %w{
  role[base]
  recipe[apcupsd]
  recipe[smartmontools]
  recipe[mdadm]
  recipe[backuppc::server]
}