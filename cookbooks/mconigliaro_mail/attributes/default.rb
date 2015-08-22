default['mconigliaro_mail']['mailname'] = node['fqdn']

default['mconigliaro_mail']['postfix']['inet_interfaces'] = %w(loopback-only)
default['mconigliaro_mail']['postfix']['virtual_alias_domains'] = []
default['mconigliaro_mail']['postfix']['relayhost'] = nil

default['mconigliaro_mail']['postfix']['maps']['access_client'] = []
default['mconigliaro_mail']['postfix']['maps']['access_sender'] = []
default['mconigliaro_mail']['postfix']['maps']['generic'] = []
default['mconigliaro_mail']['postfix']['maps']['virtual'] = []
default['mconigliaro_mail']['postfix']['maps']['sasl_password'] = []

default['mconigliaro_mail']['postfix']['aliases'] = []
