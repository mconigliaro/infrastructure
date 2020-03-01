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

### Ansible 3.0
- delete obsolete `ansible/roles/*/molecule/default/Dockerfile.j2`

### Focal
- migrate from amavis to rspamd
- certbot: package not available yet?
- plexmediaserver: pre-installation script fails in Docker
- raid_devices: mdadm service renamed to mdmonitor
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
