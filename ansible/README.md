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

- Fix postfix mail forwarding
    - https://serverfault.com/questions/681278/forwarding-email-with-postfix-via-aws-ses
    - https://serverfault.com/questions/499955/aws-ses-email-address-is-not-verified-error-with-postfix-relay/634366#634366
- Upgrade to bionic/18.04
- Test focal/20.04
- Upgrade to focal/20.04
- Use modern config from https://ssl-config.mozilla.org everywhere
- Ansible 3.0: Delete obsolete `ansible/roles/*/molecule/default/Dockerfile.j2`
