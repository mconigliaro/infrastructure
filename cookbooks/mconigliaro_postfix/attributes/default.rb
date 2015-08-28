default['mconigliaro_postfix']['mailname'] = node['fqdn']

default['mconigliaro_postfix']['inet_interfaces'] = %w(loopback-only)
default['mconigliaro_postfix']['virtual_alias_domains'] = []
default['mconigliaro_postfix']['relayhost'] = nil

default['mconigliaro_postfix']['maps']['access_client'] = []
default['mconigliaro_postfix']['maps']['access_sender'] = []
default['mconigliaro_postfix']['maps']['generic'] = []
default['mconigliaro_postfix']['maps']['virtual'] = []
default['mconigliaro_postfix']['maps']['sasl_password'] = []

default['mconigliaro_postfix']['aliases'] = []

default['mconigliaro_postfix']['postgrey']['delay'] = 1
