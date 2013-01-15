default["mail"] = {
  "mailname" => nil,
  "postfix" => {
    "inet_interfaces"       => ["loopback-only"],
    "relayhost"             => nil,
    "virtual_alias_domains" => [],
    "aliases"               => ["root: vagrant"],
    "maps" => {
      "access_client" => [],
      "access_sender" => [],
      "generic"       => [],
      "virtual"       => [],
      "sasl_password" => []
    },
    "notify_classes" => ["resource", "software"]
  },
  "postgrey" => {
    "delay" => 1
  }
}
