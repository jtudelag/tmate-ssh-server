Code to create an inmutable [tmate](https://tmate.io/) private SSH Server on [Fedora CoreOS](https://docs.fedoraproject.org/en-US/fedora-coreos/).

1. First update the ssh-key and password of the core user in tmate-ssh-server.fcc.

2. Convert the Fedore CoreOS (FCOS) Config to ignition using the FCOS transpiler.
```bash
podman run -i --rm quay.io/coreos/fcct:release --pretty --strict < tmate-ssh-server.fcc > tmate-ssh-server.ign
```
3. Now you can use `tmate-ssh-server.ign` to set up your inmutable tmate server.