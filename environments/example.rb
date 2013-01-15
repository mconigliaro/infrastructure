name "example"
description "Example"
override_attributes({
  :apache => {
    :default_redirect_path => "http://example.org"
  },
  :apcupsd => {
    :isconfigured => "yes",
    :upscable     => "usb",
    :upstype      => "usb",
    :device       => "",
  },
  :backuppc => {
    :users => [
      "mike"
    ],
    :hosts => {
      "mail.example.com" => {
        :XferMethod     => '"rsync"',
        :PingPath       => "/bin/echo",
        :RsyncShareName => '["/home"]'
      },
      "localhost" => {
        :XferMethod     => '"rsync"',
        :RsyncShareName => '["/home"]'
      }
    }
  },
  :chef => {
    :client => {
      :daemon_enabled         => true,
      :interval               => 3600,
      :splay                  => 60,
      :chef_server_url        => "https://api.opscode.com/organizations/example",
      :validation_client_name => "example-validator"
    }
  },
  :ddclient => {
    :run_daemon => "true",
    :login      => "login",
    :password   => "password",
    :custom     => "yes",
    :hosts      => [
      "home.example.com",
      "mail.example.com",
      "home.example.org",
      "mail.example.org"
    ],
  },
  :mail => {
    :mailname => "home.example.org",
    :postfix => {
      :inet_interfaces       => ["all"],
      :virtual_alias_domains => ["example.com", "example.org"],
      :relayhost             => "[smtp.example.net]:587",
      :aliases => [
        "root: mike"
      ],
      :maps => {
        :access_sender => [
          "user@example.com REJECT Comment"
        ],
        :sasl_password => [
          "smtp.example.net user:password"
        ],
        :virtual => [
          "mike@example.com  mike",
          "mike@example.org  mike",
          "@example.org      mike"
        ]
      }
    }
  },
  :mdadm => {
    :arrays => {
      "/dev/md0" => {
        :devices => ["/dev/sdb1", "/dev/sdc1"],
        :level   => 1,
        :action  => [:create, :assemble]
      }
    },
    :mounts => {
      "/mnt/backups" => {
        :device => "/dev/md0",
        :action => [:enable, :mount]
      }
    }
  },
  :minidlna => {
    :media_dirs => [
      "/home/example/media"
    ]
  },
  :nfs => {
    :mounts => {
      "/home" => "/srv/nfs/home"
    },
    :exports => {
      "/srv/nfs"      => "*(rw,sync,fsid=0,crossmnt,no_subtree_check,no_root_squash)",
      "/srv/nfs/home" => "*(rw,sync,no_subtree_check,no_root_squash)"
    }
  },
  :samba => {
    :workgroup => "EXAMPLE",
  },
  :smartmontools => {
    :start_smartd => "yes"
  },
  :ubuntu => {
    :timezone => "America/Denver"
  },
  :users => {
    :github_sync => false
  }
})
