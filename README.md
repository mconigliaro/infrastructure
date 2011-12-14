New Server Setup
================

Install RVM
-----------

    aptitude install -y build-essential git-core build-essential bison openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-0 libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake
    bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)
    /etc/profile.d/rvm.sh
    rvm install ruby-1.9.3
    rvm --default use ruby-1.9.3

Install Chef
------------

    gem install chef ohai

Configure Chef
--------------

    /bin/cat <<END > /etc/chef/client.rb
    chef_server_url          "https://api.opscode.com/organizations/conigliaro"
    node_name                "i-1a85037a"
    validation_client_name   "conigliaro-validator"
    verbose_logging          false
    END
