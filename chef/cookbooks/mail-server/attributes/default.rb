default[:'mail-server'] = {
  :relayhost             => nil,
  :virtual_alias_domains => [],
  :aliases               => [
    "root: vagrant"
  ],
  :maps => {
    :access_client  => [],
    :access_sender  => [],
    :generic        => [],
    :virtual        => [],
    :sasl_password  => []
  },
  :postgrey => {
    :delay => 1
  },
  :notify_classes => [
    "resource",
    "software"
  ]
}
