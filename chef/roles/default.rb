name 'default'
description 'The default/base role for all nodes (i.e. all other roles are assumed to be "layered" on top of this one)'

default_run_list = %w{
  recipe[base::locale]
  recipe[apt]
  recipe[base::packages]
  recipe[sudo]
  recipe[unattended-upgrades]
  recipe[monit]
  recipe[ntp]
  recipe[rsyslog]
  recipe[openssh::server]
  recipe[mail-server]
  recipe[mutt]
  recipe[conigliaro]
  recipe[base::timezone]
}

remote_run_list = default_run_list + %w{
  recipe[fail2ban]
  recipe[ddclient]
}

env_run_lists({
  'ec2'      => remote_run_list,
  'home'     => remote_run_list + %w{ recipe[backuppc::server] },
  '_default' => default_run_list
})
