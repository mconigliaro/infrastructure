name 'default'
description 'The default/base role for all nodes (i.e. all other roles are assumed to be "layered" on top of this one)'
run_list 'recipe[base]', 'recipe[unattended-upgrades]', 'recipe[monit]', 'recipe[ntp]',
         'recipe[fail2ban]', 'recipe[openssh::server]', 'recipe[ddclient]', 'recipe[mail-server]',
         'recipe[nginx]', 'recipe[php]', 'recipe[conigliaro]'
