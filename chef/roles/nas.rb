name "nas"
description "NAS server"

default_run_list = %w{
  role[server]
  recipe[smartmontools]
  recipe[mdadm]
}

production_run_list = default_run_list + %w{
  recipe[apcupsd]
}

env_run_lists({
  "ec2"      => production_run_list,
  "home"     => production_run_list,
  "_default" => default_run_list
})
