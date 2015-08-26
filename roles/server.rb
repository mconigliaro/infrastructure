name 'server'
description 'Server'
run_list %w(
  mconigliaro_apt
  mconigliaro_ubuntu::packages
  mconigliaro_sysstat
  mconigliaro_unattended_upgrades
  mconigliaro_monit
  mconigliaro_ntp
  mconigliaro_rsyslog
  mconigliaro_openssh
  mconigliaro_postfix
  mconigliaro_mutt
  mconigliaro_ddclient
  mconigliaro_users
)
