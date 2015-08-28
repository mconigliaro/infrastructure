# Infrastructure

## Running Chef

    aptitude install git
    git clone https://github.com/mconigliaro/infrastructure.git
    cd infrastructure
    vi json_attributes/<role>.json
    ./run-chef <role>

## NAS

### Configuring Samba

    passwd <user>
    smbpasswd -a <user>
    net rpc rights grant -U <user> '<DOMAIN>\Domain Admins' SeMachineAccountPrivilege SePrintOperatorPrivilege SeAddUsersPrivilege SeDiskOperatorPrivilege SeRemoteShutdownPrivilege

### Using the NAS as an Apple Time Machine Device

Time Machine support is enabled by default on all volumes. This means users can use Time Machine to back up to their home directories. However, the following command must be run manually on the client before Time Machine will recognize the home directory as a supported Time Machine device:

    defaults write com.apple.systempreferences TMShowUnsupportedNetworkVolumes 1

## Ports Used

### Server

  - 22 (SSH)
  - 60000-61000 (Mosh)

### Mail

  - 25 (SMTP)
  - 587 (Submission)
  - 993 (IMAPS)
