# Ansible Provisioner

## Description
Packer ansible Provisioner installs and configures vault, and other dependencies

## Playbook Structure
- **site.yml**
- **roles**

The ansible roles are called in the following order:
- **rhel_packages:** installs important packages and dependencies
- **vault_install:** downloads vault binary
- **firewall_rule:** installs ufw, configures ufw and vault ports
- **configure_vault:** configures vault as a service
- **goss:** downloads goss binary and runs script for testing of server configuration