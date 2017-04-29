# Infrastructure

## Cookbook Development

### Creating New Cookbooks

    cd cookbooks
    ./generate <name>

## Running Chef

### Setup

    apt-get install git
    git clone https://github.com/mconigliaro/infrastructure.git
    vi infrastructure/json_attributes/<role>.json

### Run

    cd infrastructure
    git pull
    ./run-chef <role>

## Mail

### Migrating to New Instance

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

## NAS

### Configuring Samba

    passwd <user>
    smbpasswd -a <user>
    net rpc rights grant -U <user> '<DOMAIN>\Domain Admins' SeMachineAccountPrivilege SePrintOperatorPrivilege SeAddUsersPrivilege SeDiskOperatorPrivilege SeRemoteShutdownPrivilege

### Using the NAS as an Apple Time Machine Device

Time Machine support is enabled by default on all volumes. This means users can use Time Machine to back up to their home directories. However, the following command must be run manually on the client before Time Machine will recognize the home directory as a supported Time Machine device:

    defaults write com.apple.systempreferences TMShowUnsupportedNetworkVolumes 1

## Ports Used

### All

  - 22 (SSH)

### Mail

  - 25 (SMTP)
  - 587 (Submission)
  - 143 (IMAP)

### NAS

  - 631 (CUPS)
  - 32400 (Plex)
