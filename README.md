# ansible-role-hashicorp
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![CI](https://github.com/jesmigel/ansible-role-hashicorp/actions/workflows/lint.yaml/badge.svg?branch=main)](https://github.com/jesmigel/ansible-role-hashicorp/actions/workflows/lint.yaml)

Ansible hashicorp role. Used for bootstrapping a host with Hashicorp tools.

### Dependencies
| Dependency | Comments |
| - | - |
| [Ansible](https://docs.ansible.com/) | Configuration management automation tool|
| [ESXI (6.7u3)](https://my.vmware.com/en/group/vmware/evalcenter?p=free-esxi6) | Hypervisor |
| [Python](https://www.python.org/downloads/) | Programming language required to run ansible |
| [Vagrant](https://www.vagrantup.com/docs) | VM manager. Local dev/test environment |
| [Virtualenv](https://docs.python.org/3/tutorial/venv.html) | Python environment isolation |
|||


### Make Commands
| Command | Comments |
| - | - |
| address | Displays  image ipv4 addresses of the VM's identified by vagrant |
| clean | Destroys the VM's and cleans the vagrant cache |
| config | Validates the vagrant configuration |
| down | Suspends the VM's |
| lint | Exectutes ansible-lint that references yamllint |
| login | SSH to the VM using the ssh-config referred to by vagrant |
| provision | Executes the provisioner configured in the vagrant file |
| status | Used to identify the health of the VM with respect to vagrant |
| up | Creates or starts the VM(s) |
| venv_init | initialises virtual env directory. Required by the provisioners |
| ||

### Preflieght Steps
1. Copy the [sample.env.yaml](./sample.env.yaml) to `env.yaml` and populate the following fields
    - `vm.datastore`: # datastore used by the target ESXi Host
    - `host`: # ESXi host
    - `user`: # ESXi user id
    - `password`: # ESXi password
    - `networks`: # Network in ESXi. It must be on the same subnet as the end user
    - Optional
        - `nameserver_list`: # List of custom nameservers.
        - `nameserver_test`: # fqdn resolved by a DNS stated in `nameserver_list`

### Tests
- `Lint`: yamllint and ansible-lint. This is automated through Github Actions
- `Functional`: Tested through Vagrant and ESXi. To be added in github actions

### Usage
This repository is used as an ansible role. It can be referenced through a requirements.yaml file.
```yaml
# from github
- src: https://github.com/jesmigel/ansible-role-hashicorp.git
  name: hashicorp
```

The role can be installed through the ansible-galaxy command:
```bash
ansible-galaxy role install -r requirements.yaml -p $ROLE_DIRECTORY
```

### ToDo
1. DevOps CI/CD test
    - Github Actions
    - Jenkins
2. Badges
    - License
    - CI/CD test results
