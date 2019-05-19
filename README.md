# Infrastructure

## Using Ansible

All commands are expected to be run inside a pipenv shell:

    cd ansible
    pipenv shell

Run ansible:

    ansible-playbook <role>.yml

## Role Notes

### NAS

#### Configuring Samba

    passwd <user>
    smbpasswd -a <user>
