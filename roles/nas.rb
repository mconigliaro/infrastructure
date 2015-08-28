name 'nas'
description 'Network appliance server'
run_list %w(
  role[server]
  mconigliaro_ubuntu::grub
  mconigliaro_smartmontools
  mconigliaro_mdadm
  mconigliaro_nfs_server
  mconigliaro_avahi
  mconigliaro_netatalk
  mconigliaro_cups
  mconigliaro_samba
  mconigliaro_plex
)
