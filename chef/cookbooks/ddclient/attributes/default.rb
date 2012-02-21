default[:ddclient] = {
  :pid             => "/var/run/ddclient.pid",
  :daemon_interval => 300,
  :protocol        => "dyndns2",
  :server          => "members.dyndns.org",
  :login           => nil,
  :password        => nil,
  :use             => "web, web=checkip.dyndns.org",
  :custom          => "no",
  :mx              => nil,
  :wildcard        => "no",
  :hosts           => []
}
