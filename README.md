# ansible-role-hashicorp
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![CI](https://github.com/jesmigel/ansible-role-hashicorp/actions/workflows/build.yaml/badge.svg?branch=main)](https://github.com/jesmigel/ansible-role-hashicorp/actions/workflows/build.yaml)

Ansible hashicorp role. Used for bootstrapping a host with Hashicorp tools.

### References
| Name | Comments |
| - | - |
| [Dependencies](https://github.com/jesmigel/ansible-role-common#dependencies) | Deployment Toolchain |
| [Make Commands](https://github.com/jesmigel/ansible-role-common#make-commands) | Deployment Shortcuts |
| [Preflight Steps](https://github.com/jesmigel/ansible-role-common#preflieght-steps) | Pre deployment configuration 
|||

### Tools Installed
| Name | Comments |
| - | - |
| [Vagrant](https://www.vagrantup.com/docs) | Open source software product for building and maintaining portable virtual software development environments |
| [Packer](https://www.packer.io/docs) | Open source tool for creating golden images for multiple platforms from a single source configuration. |
| [Terraform](https://www.terraform.io/intro/index.html) | Open-source infrastructure as code software tool created by HashiCorp. Users define and provide data center infrastructure using a declarative configuration language. |
|||

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
    - Jenkins
