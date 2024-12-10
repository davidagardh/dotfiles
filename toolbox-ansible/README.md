# Toolbx config through Ansible

- [Toolbx](https://containertoolbx.org/)
- [Ansible](https://docs.ansible.com/ansible/latest/index.html)

## Purpose

This ansible playbook sets up a default fedora-toolbox container with all the packages and other config I need. It's intended to be used both for setting up a brand new container (which needs to be done after every major Fedora version) and for updating an existing container.

## Use

´´´
> toolbox create
> echo "[toolbox]\nfedora-toolbox-41 ansible_connection=podman" | sudo tee /etc/ansible/hosts
´´´

## Problems

You might need to install the podman connection from ansible galaxy, but I have never needed to. If so, that's ´ansible-galaxy collection install containers.podman´

For first run might need you to install libdnf inside the toolbx. ´toolbox run sudo dnf install -y python-libdnf´
