#!/usr/bin/env bash
set -euo pipefail

# ╭──────────────────────────────────────────────────────────╮
# │          ensure root is not runnint this script          │
# ╰──────────────────────────────────────────────────────────╯

if [[ $EUID -eq 0 ]]; then
   echo "You must run this script as non-root user with sudo permission." 1>&2
   exit 1
fi

export INSTANCE_NAME="$(curl -sH Metadata:true --noproxy '*' 'http://169.254.169.254/metadata/instance/compute/name?api-version=2020-09-01&format=text')"
export LOCAL_IPV4="$(curl -sH Metadata:true --noproxy '*' 'http://169.254.169.254/metadata/instance/network/interface/0/ipv4/ipAddress/0/privateIpAddress?api-version=2020-09-01&format=text')"

# ╭──────────────────────────────────────────────────────────╮
# │         check env vars are present and populated         │
# ╰──────────────────────────────────────────────────────────╯
if [ -z "${INSTANCE_NAME+x}" ] || [ -z "${INSTANCE_NAME}" ]; then 
   echo >&2 "*** the 'INSTANCE_NAME' environment variable is required" ; 
   exit 1 ;
fi

if [ -z "${LOCAL_IPV4+x}" ] || [ -z "${LOCAL_IPV4}" ]; then
   echo >&2 "*** the 'LOCAL_IPV4' environment variable is required" 
   exit 1 ;
fi

if [ -z "${TENANT_ID+x}" ] || [ -z "${TENANT_ID}" ]; then
   echo >&2 "*** the 'TENANT_IDc' environment variable is required"
   exit 1 ;
fi

if [ -z "${VAULT_NAME+x}" ] || [ -z "${VAULT_NAME}" ]; then
   echo >&2 "*** the 'VAULT_NAME' environment variable is required"
   exit 1 ;
fi 

if [ -z "${KEY_NAME+x}" ] || [ -z "${KEY_NAME}" ]; then
   echo >&2 "*** the 'KEY_NAME' environment variable is required"
   exit 1 ;
fi 

if [ -z "${SUBSCRIPTION_ID+x}" ] || [ -z "${SUBSCRIPTION_ID}" ]; then
   echo >&2 "*** the 'SUBSCRIPTION_ID' environment variable is required"
   exit 1 ;
fi 

if [ -z "${RESOURCE_GROUP_NAME+x}" ] || [ -z "${RESOURCE_GROUP_NAME}" ]; then
   echo >&2 "*** the 'RESOURCE_GROUP_NAME' environment variable is required"
   exit 1 ;
fi 

if [ -z "${VM_SCALE_SET_NAME+x}" ] || [ -z "${VM_SCALE_SET_NAME}" ]; then
   echo >&2 "*** the 'VM_SCALE_SET_NAME' environment variable is required"
   exit 1 ;
fi 

if [ -z "${LEADER_TLS_SERVERNAME+x}" ] || [ -z "${LEADER_TLS_SERVERNAME}" ]; then
   echo >&2 "*** the 'LEADER_TLS_SERVER_NAME' environment variable is required"
   exit 1 ;
fi 

# ╭──────────────────────────────────────────────────────────╮
# │                render and store template                 │
# ╰──────────────────────────────────────────────────────────╯
while read "$tmpl";do
  cat "${tmpl}" | envsubst > "/etc/vault.d/$(basename "${tmpl}").hcl"
done < <(find "/var/vault.d" -type f -name "*.tmpl")
