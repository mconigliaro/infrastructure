default[:'mail-server'] = {
  :relayhost             => nil,
  :virtual_alias_domains => [],
  :aliases               => [],
  :maps => {
    :access_client  => [],
    :access_sender  => [],
    :generic        => [],
    :virtual        => [],
    :sasl_password  => []
  },
  :postgrey => {
    :delay => 1
  }
}
