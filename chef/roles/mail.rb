name "mail"
description "Mail server"
run_list %w{
  role[server]
  recipe[mail::server]
}
