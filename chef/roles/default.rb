name "default"
description 'The default/base role for all nodes (i.e. all other roles are assumed to be "layered" on top of this one)'

# FIXME: recipe[chef::client] goes after monit
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
  recipe[fail2ban]
  recipe[mail-server]
  recipe[mutt]
  recipe[conigliaro]
  recipe[base::timezone]
}

env_run_lists({
  "ec2"  => default_run_list + %w{
    recipe[ddclient]
  },
  "home" => default_run_list + %w{
    recipe[apcupsd]
    recipe[smartmontools]
    recipe[mdadm]
    recipe[backuppc::server]
  },
  "_default" => default_run_list
})
