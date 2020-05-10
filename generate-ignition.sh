#!/bin/bash
set -x

FCOS_SSH_KEY="fcos-ssh-keys/fcos_tmate_key"
# Generate UID, not to overwrite keys
UUID=$(uuidgen| cut -d'-' -f1)

ssh-keygen -b 2048 -t rsa -f "${FCOS_SSH_KEY}_${UUID}" -q -N ""
cat "${FCOS_SSH_KEY}_${UUID}" > fakeroot/root/.ssh/authorized_keys
podman run --rm -ti --volume `pwd`:/srv:z localhost/filetranspiler:latest -f fakeroot/ -i ignitions/base.ign -p -o  ignitions/tmate-ssh-server.ign

