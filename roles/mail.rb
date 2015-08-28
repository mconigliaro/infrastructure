name 'mail'
description 'Mail server'
run_list %w(
  role[server]
  mconigliaro_postfix::amavis
  mconigliaro_dovecot::auth
  mconigliaro_dovecot::imap
)
