name 'nas'
description 'Network appliance server'
run_list %w(
  role[server]
  mconigliaro_mdadm
  mconigliaro_mount
  mconigliaro_users
  mconigliaro_aws::ec2_update_dns
  mconigliaro_ubuntu::grub
  mconigliaro_smartmontools
  mconigliaro_nfs_server
  mconigliaro_avahi
  mconigliaro_netatalk
  mconigliaro_cups
  mconigliaro_samba
  mconigliaro_plexmediaserver
  mconigliaro_attic
)
