default[:ddclient][:pid]             = '/var/run/ddclient.pid'
default[:ddclient][:daemon_interval] = 300
default[:ddclient][:protocol]        = 'dyndns2'
default[:ddclient][:server]          = 'members.dyndns.org'
default[:ddclient][:login]           = nil
default[:ddclient][:password]        = nil
default[:ddclient][:use]             = 'web, web=checkip.dyndns.org'
default[:ddclient][:custom]          = 'no'
default[:ddclient][:mx]              = nil
default[:ddclient][:wildcard]        = 'no'
default[:ddclient][:hosts]           = []
