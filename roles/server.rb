name 'server'
description 'Server'
run_list %w(
  mconigliaro_ubuntu::swap
  mconigliaro_hosts
  mconigliaro_apt
  mconigliaro_chef_client
  mconigliaro_ubuntu::packages
  mconigliaro_unattended_upgrades
  mconigliaro_sysstat
  mconigliaro_monit
  mconigliaro_ntp
  mconigliaro_rsyslog
  mconigliaro_openssh
  mconigliaro_letsencrypt
  mconigliaro_postfix
  mconigliaro_mutt
  mconigliaro_sudo
  mconigliaro_fail2ban
)
