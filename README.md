# New Server Setup

## Install RVM

    aptitude install -y curl
    /bin/bash -s stable < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer )
    /etc/profile.d/rvm.sh
    aptitude install -y build-essential openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-0 libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison subversion
    rvm install ruby-1.9.3
    rvm use ruby-1.9.3 --default

## Install Chef

    gem install chef ohai

## Configure Chef

    mkdir /etc/chef
    /bin/cat <<END > /etc/chef/client.rb
    chef_server_url          "https://api.opscode.com/organizations/conigliaro"
    node_name                "CHANGEME"
    validation_client_name   "conigliaro-validator"
    verbose_logging          false
    END
