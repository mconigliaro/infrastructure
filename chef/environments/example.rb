name "example"
description "Example server"
default_attributes({
  :backuppc => {
    :users => [
      'mike'
    ],
    :hosts => {
      'ec2.example.com' => {
        :XferMethod     => '"rsync"',
        :PingPath       => '/bin/echo',
        :RsyncShareName => '["/home"]'
      }
    }
  },
  :base => {
    :timezone => 'America/Denver'
  },
  :ddclient => {
    :run_daemon => 'true',
    :login      => 'login',
    :password   => 'password',
    :custom     => 'yes',
    :hosts      => ['ec2.example.com', 'mail.example.com'],
  },
  :'mail-server' => {
    :virtual_alias_domains => ['example.com', 'example.org'],
    :relayhost             => '[smtp.example.net]:587',
    :aliases => [
      'root: mike'
    ],
    :maps => {
      :access_sender => [
        'user@example.com REJECT Comment'
      ],
      :sasl_password => [
        'smtp.example.net user:password'
      ],
      :virtual => [
        'mike@example.com  mike',
        'mike@example.org  mike',
        '@example.org      mike'
      ]
    }
  }
})
