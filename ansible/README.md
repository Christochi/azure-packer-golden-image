# Ansible Provisioner

## Description
Packer ansible Provisioner installs and configures vault, and other dependencies

## Playbook Structure
- **base.yml**
- **roles**

The ansible roles are called in the following order:
- **rhel-packages:** installs important packages and dependencies
- **vault-install:** downloads vault binary
- **firewallrule:** installs ufw, configures ufw and vault ports
- **configure-vault:** configures vault as a service
- **goss:** downloads goss binary and runs script for testing of server configuration