# Ansible

## Getting Started

All commands are expected to be run inside a pipenv shell:

    cd ansible
    pipenv shell

## Testing Roles

    cd roles/<role>
    molecule converge
    molecule verify
    molecule login [--host <name>]
    molecule destroy

## Running Ansible

    ansible-playbook <role>.yml

## Role Notes

### NAS

#### Configuring Samba

    passwd <user>
    smbpasswd -a <user>

## Known Issues

### Focal
- attic: package not available?
- awscli: error pip installing awscli
- certbot: package not available?
- plexmediaserver: pre-installation script fails in Docker
- postfix: tests fail until postfix is restarted manually, double check master.cf changes
- raid_devices: mdadm service renamed to mdmonitor
- route53_update_dns: depends on awscli
- review FIXMEs in all roles before upgrading

### Xenial

#### Failing Tests
- avahi
- dbus
- dovecot
- openssh
- rsyslog
- smartmontools
- vsftpd
