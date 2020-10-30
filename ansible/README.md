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

- Check chicken/egg with certbot and nginx when rebuilding mail instance
- Need to manually retrain bayes classifier after rebuilding mail instance (https://github.com/rspamd/rspamd/issues/3319)
    - `rspamc learn_ham sdbox/mailboxes/Archive/dbox-Mails/`
    - `rspamc learn_spam sdbox/mailboxes/Junk/dbox-Mails/`
- Fix postfix mail forwarding
    - https://serverfault.com/questions/681278/forwarding-email-with-postfix-via-aws-ses
    - https://serverfault.com/questions/499955/aws-ses-email-address-is-not-verified-error-with-postfix-relay/634366#634366
