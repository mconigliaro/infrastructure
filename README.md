# Infrastructure

## Using Ansible

All commands are expected to be run inside a pipenv shell:

    cd ansible
    pipenv shell

Run ansible:

    ansible-playbook <role>.yml

## Roles

### Mail

#### Migrating to New Instance

1. Create a new stack:
    ```
    aws cloudformation create-stack --stack-name <name> --template-body file://cloudformation/mail.yaml
    ```
1. Stop the old instance
1. Detach the data volume from the old instance and attach it to the new one
1. Run Chef
1. Re-associate the elastic IP with new instance
1. Set passwords for local users (for mail, etc.)
1. Destroy the old stack:
    ```
    aws cloudformation delete-stack --stack-name <name>
    ```

### NAS

#### Configuring Samba

    passwd <user>
    smbpasswd -a <user>
