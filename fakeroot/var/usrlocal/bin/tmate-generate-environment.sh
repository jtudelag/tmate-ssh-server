#!/bin/bash
ENVFILE=/etc/tmate-ssh-server.env

echo "SSH_PORT_LISTEN=2222" > "${ENVFILE}"
echo "SSH_HOSTNAME=$(ip route get 1.1.1.1 | grep -oP 'src \K\S+')" >>  "${ENVFILE}"
echo "SSH_KEYS_PATH=/ssh-keys" >> "${ENVFILE}"
echo "HAS_WEBSOCKET=0" >> "${ENVFILE}"
echo "USE_PROXY_PROTOCOL=0" >> "${ENVFILE}"
