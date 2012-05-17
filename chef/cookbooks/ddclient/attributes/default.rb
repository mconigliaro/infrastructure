default["ddclient"] = {
  "run_daemon"      => "false",
  "daemon_interval" => 300,
  "pid"             => "/var/run/ddclient.pid",
  "protocol"        => "dyndns2",
  "server"          => "members.dyndns.org",
  "login"           => "undefined",
  "password"        => "undefined",
  "use"             => "web, web=checkip.dyndns.org",
  "custom"          => "no",
  "mx"              => nil,
  "wildcard"        => "no",
  "hosts"           => []
}
