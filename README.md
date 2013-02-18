# Infrastructure

## Getting Started

Install prerequisites:

* [VirtualBox](https://www.virtualbox.org/)
* [Vagrant](http://vagrantup.com/)

Clone the repo and run the setup script:

    git clone git@github.com:mconigliaro/infrastructure.git
    cd infrastructure
    ./bin/setup.sh

## Configuring workstations

1. Install [Homebrew](http://mxcl.github.com/homebrew/)
2. `brew install git`
3. `git clone` this repo
4. Set up environment (see above)
5. `./bin/chef-solo-workstation.sh`

## Configuring servers

### Bootstrapping new servers

    aptitude update && aptitude -y install curl
    curl -L https://raw.github.com/mconigliaro/infrastructure/master/definitions/ubuntu-precise/postinstall.sh | sudo bash

Credentials are not currently managed by Chef, so the following commands must be run manually:

    passwd <user>
    smbpasswd -a <user>
    net rpc rights grant -U <user> '<DOMAIN>\Domain Admins' SeMachineAccountPrivilege SePrintOperatorPrivilege SeAddUsersPrivilege SeDiskOperatorPrivilege SeRemoteShutdownPrivilege

### Using the NAS as an Apple Time Machine device

Time Machine support is enabled by default on all volumes. This means users can use Time Machine to back up to their home directories. However, the following command must be run manually on the client before Time Machine will recognize the home directory as a supported Time Machine device:

    defaults write com.apple.systempreferences TMShowUnsupportedNetworkVolumes 1

### Port forwarding

#### Server

  - 22 (SSH)
  - 60000-61000 (Mosh)

#### Mail

  - 25 (SMTP)
  - 465 (SMTPS)
  - 993 (IMAPS)

#### NAS

  - 80 (HTTP)
  - 443 (HTTPS)
  - 4040 (HTTPS - Subsonic)
  - 8112 (HTTPS - Deluge)
