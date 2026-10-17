# Toolbx config through Ansible

- [Toolbx](https://containertoolbx.org/)
- [Ansible](https://docs.ansible.com/ansible/latest/index.html)

## Purpose

This ansible playbook sets up a default fedora-toolbox container with all the packages and other config I need. It's intended to be used both for setting up a brand new container (which needs to be done after every major Fedora version) and for updating an existing container.

## Use

Create the container, point ansible at it and run the playbook. To move to a new major Fedora version, first remove the old container with `distrobox rm toolbx`.

```sh
distrobox create --pull --name toolbx --image registry.fedoraproject.org/fedora-toolbox:latest
printf '[toolbox]\ntoolbx ansible_connection=podman\n' | sudo tee /etc/ansible/hosts
ansible-playbook run.yml
systemctl --user enable --now toolbx-update.timer
```

The timer reruns the playbook weekly to keep the container's packages up to date.

## Problems

You might need to install the podman connection from ansible galaxy, but I have never needed to. If so, that's `ansible-galaxy collection install containers.podman`

For first run might need you to install libdnf inside the toolbx. `distrobox enter toolbx -- sudo dnf install -y python-libdnf`
