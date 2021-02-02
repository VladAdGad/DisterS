# DisterS
This project created for automatically configuration your OS after fresh installation. "Configure" means installation and preparation developer
and game environments. So you can create issue to give me more ideas of what would you want to be done in this project.
For example, I did not consider graphical designer environment yet.

It is agnostic to OSes such as **Debian**, **Ubuntu** and **Windows**

## How To Use It
**Ansible** on host machine is required

1.  To run it on your local machine:

`ansible-playbook --connection=local --inventory=inventories/default.yml --vault-password-file=~/ansible_vault_password_file configure_os.yml`

-   `--vault-password-file=~/ansible_vault_password_file` required if you consider to use **ssh_keys.yml** task

2.  To run it on a remote machine please follow the Ansible documentation

## How To Run Tests
Simply inside the **configure_os** role execute

`molecule --base-config=molecule/shared/base_molecule.yml --env-file=molecule/.env.yml test --all`

-   To list what OSes currently supported execute `molecule list`
-   To test concrete OS instead of `...test --all` use `...test --scenario-name=<os_name>`

## Contribution
Follow the **Dockerfile** inside **.gitlab**. Here you can see what requirements should be achieved on your system.
Inside **.gitlab/ci** folder you can see main steps of how to run the project. It is more convenient to check pipeline definition
instead of README because README doesn't have any dependencies to update it by self as code.
