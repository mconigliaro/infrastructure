# Ansible

## Getting Started

All commands are expected to be run inside a pipenv shell:

    cd ansible
    pipenv shell

## Testing Roles

    cd roles/<role>
    molecule [--debug] converge
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

- Wait for focal rspamd packages
- Test focal
- Upgrade to focal
- Fix postfix mail forwarding
    - https://serverfault.com/questions/681278/forwarding-email-with-postfix-via-aws-ses
    - https://serverfault.com/questions/499955/aws-ses-email-address-is-not-verified-error-with-postfix-relay/634366#634366
- Ansible 3.0: Delete obsolete `ansible/roles/*/molecule/default/Dockerfile.j2`
