name "workstation"
description "Workstation"
run_list %w{
  recipe[homebrew]
  recipe[users]
}
override_attributes({
  "users" => {
    "manage" => false
  }
})
