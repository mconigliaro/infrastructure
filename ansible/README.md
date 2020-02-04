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

## FIXME

- attic: package not available for focal yet?
- avahi: tests fail on all platforms
- awscli: error pip installing awscli on focal
- certbot: package not available for focal yet?
- dovecot: tests fail in xenial (ignore)
- openssh: tests fail in xenial (ignore)
- plexmediaserver: pre-installation script fails on Docker
- postfix: ripole package not available in focal, tests fail, double check master.cf changes
- raid_devices: mdadm service missing?
- route53_update_dns: depends on awscli
- rsyslog: tests fail in xenial (ignore)
- review all FIXMEs
- review docker testing hacks (ag ansible_virtualization_type)
