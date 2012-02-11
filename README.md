## Dependencies

    gem install chef -v 0.10.8
    gem install vagrant -v 0.9.3
    gem install veewee -v 0.2.2

## New Server Setup

### Update system

    aptitude update
    aptitude -y safe-upgrade

### Install RVM and Ruby

    bash -s stable < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer )
    rvm install ruby-1.9.3
    rvm use ruby-1.9.3 --default

### Install Chef

    gem install chef ohai

### Configure Chef

    mkdir /etc/chef
    /bin/cat <<END > /etc/chef/client.rb
    chef_server_url          "https://api.opscode.com/organizations/conigliaro"
    node_name                "CHANGEME"
    validation_client_name   "conigliaro-validator"
    verbose_logging          false
    END

## Port forwarding

- 22 (SSH)
- 25 (SMTP)
- 80 (HTTP)
- 443 (HTTPS)
- 465 (SMTPS)
- 993 (IMAPS)
