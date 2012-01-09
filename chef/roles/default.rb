name 'default'
description 'The default/base role for all nodes (i.e. all other roles are assumed to be "layered" on top of this one)'

default_run_list = %w{
  recipe[base::locale]
  recipe[base::packages]
  recipe[sudo]
  recipe[unattended-upgrades]
  recipe[monit]
  recipe[ntp]
  recipe[rsyslog]
  recipe[fail2ban]
  recipe[openssh::server]
  recipe[ddclient]
  recipe[mail-server]
  recipe[mutt]
  recipe[conigliaro]
  recipe[base::timezone]
}

env_run_lists({
  'ec2'      => default_run_list,
  'home'     => default_run_list + %w{ recipe[backuppc::server] },
  '_default' => default_run_list
})
