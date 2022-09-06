# Ansible Provisioner

## Description
Packer ansible Provisioner installs and configures vault, and other dependencies

## Playbook Structure
- **site.yml**
- **roles**

The ansible roles are called in the following order:
- **rhel_packages:** installs important packages and dependencies
- **vault_install:** downloads vault binary
- **firewall_rule:** configures firewall rules with iptables
- **configure_vault:** configures vault for production
  - **init-vault-tls script**: this script would pull CA and tls key-pair from a trusted source and stored them 
  - **render-vault-config script**: this script would use envsubst to render templated configuration artifacts (see vault-tmpl-config.yml) and store the final result in a different location
  - **vault-dr-cluster-setup script**: this script runs after Vault daemon starts and sets up Vault DR cluster
- **splunk_agent:** splunk configuration to read logs from journald
- **goss:** downloads goss binary and runs script for testing of server configuration