# Infrastructure

## Install dependencies

* [VirtualBox](https://www.virtualbox.org/)
* [Vagrant](http://vagrantup.com/)

## Set up environment

    ./setup.sh

## Bootstrapping new servers

    aptitude update && aptitude -y install curl
    curl -L https://raw.github.com/mconigliaro/infrastructure/master/definitions/ubuntu-precise/postinstall.sh | sudo bash

Credentials are not currently managed by Chef, so the following commands must be run manually:

    passwd <user>
    smbpasswd -a <user>
    net rpc rights grant -U <user> '<DOMAIN>\Domain Admins' SeMachineAccountPrivilege SePrintOperatorPrivilege SeAddUsersPrivilege SeDiskOperatorPrivilege SeRemoteShutdownPrivilege

## Port forwarding

### Server

  - 22 (SSH)
  - 60000-61000 (Mosh)

### Mail

  - 25 (SMTP)
  - 465 (SMTPS)
  - 993 (IMAPS)

### NAS

  - 80 (HTTP)
  - 443 (HTTPS)
  - 4040 (HTTPS - Subsonic)
  - 8112 (HTTPS - Deluge)
