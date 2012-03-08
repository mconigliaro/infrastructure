name "base"
description "The base role"

# FIXME: recipe[chef::client] goes after monit once we get packages for 12.04
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
  recipe[mail]
  recipe[mutt]
  recipe[conigliaro]
  recipe[base::timezone]
}

production_run_list = default_run_list + %w{
  recipe[ddclient]
}

env_run_lists({
  "ec2"      => production_run_list,
  "home"     => production_run_list,
  "_default" => default_run_list
})
