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

## To Do

#### Known Failing Tests (Xenial)
- avahi
- dbus
- dovecot
- openssh
- rsyslog
- smartmontools
- vsftpd

### Ansible 3.0
- delete obsolete `ansible/roles/*/molecule/default/Dockerfile.j2`
