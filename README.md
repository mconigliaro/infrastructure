# Infrastructure

## Install dependencies

* [VirtualBox](https://www.virtualbox.org/)

## Install gem dependencies

    ./setup.sh

## New Server Setup

### Update system

    aptitude update
    aptitude -y safe-upgrade

### Install Chef

    echo "deb http://apt.opscode.com/ `lsb_release -cs`-0.10 main" >> /etc/apt/sources.list.d/opscode.list
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

- 22 (SSH)
- 25 (SMTP)
- 80 (HTTP)
- 443 (HTTPS)
- 465 (SMTPS)
- 993 (IMAPS)
