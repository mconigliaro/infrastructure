name "mail"
description "Mail server"
run_list %w{
  role[base]
  recipe[mail::server]
}
