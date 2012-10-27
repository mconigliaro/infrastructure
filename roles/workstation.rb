name "workstation"
description "Workstation"
run_list %w{
  recipe[homebrew]
  recipe[users]
}
