name "workstation"
description "Workstation"
run_list %w{
  recipe[homebrew]
  recipe[users]
  recipe[sublime]
}
override_attributes({
  "users" => {
    "manage" => false
  }
})
