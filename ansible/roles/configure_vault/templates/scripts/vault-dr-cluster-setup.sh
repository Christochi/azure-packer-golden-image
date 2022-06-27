#!/bin/bash

# setup primary and secondary cluster for DR 
# on primary
echo "enabling Disaster Recovery on primary"
curl -s \
    --request POST \
    --header "X-Vault-Token: $VAULT_TOKEN" \
    -d '{ "primary_api_addr": "$VAULT_ADDR" }' \
    $VAULT_ADDR/v1/sys/replication/dr/primary/enable | jq -r ".warnings"

echo "sleeping 5 seconds"
sleep 5

echo "Revoking Secondary if exists to able to generate a new secondary token with same secondary name"
sr_req="curl -s --request POST --header \"X-Vault-Token: $VAULT_TOKEN\" -d '{\"id\": \"$VAULT_SECONDARY_CLUSTER_NAME\"}' $VAULT_ADDR/v1/sys/replication/dr/primary/revoke-secondary"
SEC_REQ=$(eval $sr_req)
echo $SEC_REQ | jq -r ".warnings"

echo "Generating DR Token and Activating secondary"
s_req="curl -s --request POST --header \"X-Vault-Token: $VAULT_TOKEN\" -d '{\"id\": \"$VAULT_SECONDARY_CLUSTER_NAME\"}' $VAULT_ADDR/v1/sys/replication/dr/primary/secondary-token"
SEC_REQ=$(eval $s_req)
SEC_TOKEN=$(echo $SEC_REQ | jq -r ".wrap_info.token")
echo "$VAULT_SECONDARY_CLUSTER_NAME token: $SEC_TOKEN"

# on secondary
echo "enabling Disaster Recovery on secondary"
dr_req="curl -s --request POST --header \"X-Vault-Token: $VAULT_TOKEN_DR\" -d '{ \"token\": \"$SEC_TOKEN\", \"primary_api_addr\": \"$VAULT_ADDR\", \"ca_file\": \"/var/tls/vault/ca.pem\"}' $VAULT_ADDR_DR/v1/sys/replication/dr/secondary/enable"
DR_REQ=$(eval $dr_req)
echo $DR_REQ
