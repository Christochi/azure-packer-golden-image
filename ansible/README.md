# Ansible Provisioner

## Description
Packer ansible Provisioner installs and configures vault, and other dependencies

## Playbook Structure
- **base.yml**
- **roles**

The ansible roles are called in the following order:
- **01-rhel-packages:** installs important packages and dependencies
- **02-vault-install:** downloads vault binary
- **03-configure-vault:** configures vault as a service
- **04-goss:** downloads goss binary for testing of server configuration