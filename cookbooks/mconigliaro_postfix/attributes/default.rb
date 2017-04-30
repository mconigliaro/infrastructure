default['mconigliaro_postfix']['myhostname'] = node['fqdn'] || node['hostname']

default['mconigliaro_postfix']['inet_interfaces'] = %w(all)
default['mconigliaro_postfix']['virtual_alias_domains'] = []
default['mconigliaro_postfix']['relayhost'] = nil

default['mconigliaro_postfix']['maps']['access_client'] = []
default['mconigliaro_postfix']['maps']['access_sender'] = []
default['mconigliaro_postfix']['maps']['generic'] = []
default['mconigliaro_postfix']['maps']['virtual'] = []
default['mconigliaro_postfix']['maps']['sasl_password'] = []

default['mconigliaro_postfix']['sensitive_maps'] = %w(sasl_password)

default['mconigliaro_postfix']['smtpd_tls_cert_file'] = '/etc/ssl/certs/ssl-cert-snakeoil.pem'
default['mconigliaro_postfix']['smtpd_tls_key_file'] = '/etc/ssl/private/ssl-cert-snakeoil.key'

default['mconigliaro_postfix']['aliases'] = []

default['mconigliaro_postfix']['postgrey']['delay'] = 1
