# Infrastructure

## Install dependencies

* [VirtualBox](https://www.virtualbox.org/)

## Install gem dependencies

    gem install thor
    thor setup:gems

## New Server Setup

### Update system

    aptitude update
    aptitude -y full-upgrade

### Install Chef

    echo "deb http://apt.opscode.com/ `lsb_release -cs`-0.10 main" > /etc/apt/sources.list.d/opscode.list
    wget -O - -q http://apt.opscode.com/packages@opscode.com.gpg.key | apt-key add -
    aptitude update
    echo "chef chef/chef_server_url string" | debconf-set-selections
    aptitude -y install chef

### Configure Chef

    /bin/cat <<END > /etc/chef/client.rb
    chef_server_url          "https://api.opscode.com/organizations/conigliaro"
    node_name                "CHANGEME"
    validation_client_name   "conigliaro-validator"
    verbose_logging          false
    END

## Port forwarding

### Server

  - 22 (SSH)

### Mail

  - 25 (SMTP)
  - 465 (SMTPS)
  - 993 (IMAPS)

### NAS

  - 80 (HTTP)
  - 443 (HTTPS)
  - 4040 (Subsonic)

### Known issues

  - https://bugs.launchpad.net/ubuntu/+source/amavisd-new/+bug/930916