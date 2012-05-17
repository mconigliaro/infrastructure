default["chef"] = {
  "client" => {
    "daemon_enabled"         => false,
    "interval"               => 1800,
    "splay"                  => 20,
    "chef_server_url"        => "http://localhost:4000",
    "validation_client_name" => "chef-validator"
  }
}
