#!/bin/bash
set -eu

PRIVATE_SSH_KEYS_FOLDER="${SSH_KEYS_FOLDER:-/var/usrlocal/lib/tmate-ssh-keys}"

gen_key() {
  keytype=$1
  ks="${keytype}_"
  key="${PRIVATE_SSH_KEYS_FOLDER}/ssh_host_${ks}key"
  if [ ! -e "${key}" ] ; then
    ssh-keygen -t ${keytype} -f "${key}" -N ''
    echo ""
  fi
  SIG=$(ssh-keygen -l -E SHA256 -f $key.pub | cut -d ' ' -f 2)
}

rm -rf "${PRIVATE_SSH_KEYS_FOLDER}"
mkdir -p "${PRIVATE_SSH_KEYS_FOLDER}"

gen_key rsa
RSA_SIG=$SIG
gen_key ed25519
ED25519_SIG=$SIG

echo "You may use the following settings this in your .tmate.conf:"
echo ""
echo "set -g tmate-server-host ${SSH_HOSTNAME}"
echo "set -g tmate-server-port ${SSH_PORT_LISTEN}"
echo "set -g tmate-server-rsa-fingerprint ${RSA_SIG}"
echo "set -g tmate-server-ed25519-fingerprint ${ED25519_SIG}"
echo ""
