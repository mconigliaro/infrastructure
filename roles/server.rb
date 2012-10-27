name "server"
description "Server"
run_list %w{
  recipe[ubuntu::locale]
  recipe[apt]
  recipe[ubuntu::packages]
  recipe[git]
  recipe[sysstat]
  recipe[sudo]
  recipe[unattended-upgrades]
  recipe[monit]
  recipe[chef::client]
  recipe[ntp]
  recipe[rsyslog]
  recipe[openssh::server]
  recipe[fail2ban]
  recipe[mail]
  recipe[ddclient]
  recipe[mutt]
  recipe[ubuntu::timezone]
  recipe[ubuntu::bugs]
  recipe[users]
}
