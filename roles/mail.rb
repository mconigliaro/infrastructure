name 'mail'
description 'Mail server'
run_list %w(
  role[server]
  mconigliaro_ubuntu::swap
  mconigliaro_users
  mconigliaro_postfix::amavis
  mconigliaro_postfix::postgrey
  mconigliaro_dovecot::auth
  mconigliaro_dovecot::imap
)
