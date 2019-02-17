Create myself a friendly environment. I WANT zsh

# TODO

- Incorporate ideas from https://github.com/bbkane/riced.git too.
- Add zsh
- separate tasks into roles.
- Create base-box with common stuff installed and build off that.

# Usage

- Install Vagrant, VirtualBox, and Ansible (see the blog post for how I do this).

- Create the VMs:

```
vagrant up
```

- Create the local `ssh_config` file:

```
vagrant ssh-config > ssh_config
```

- Ping your new VMs with Ansible:

```
ansible all -m ping
```

- Run the test playbook:

```
ansible-playbook main.yml
```
