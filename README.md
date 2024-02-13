Exposing honeypot and Port Knocking using Ansible
==================

Malicious individuals and scripts will always target any computer connected to the Internet in an attempt to exploit security flaws.

Using Ansible Port Knocking, you can fortify your infrastructure with additional security. For all designated servers, this Ansible role activates the [port knocking](https://en.wikipedia.org/wiki/Port_knocking) capability.
feature for all specified servers.

Requirements
------------

This role requires Ansible-core 2.12 or higher, and platform requirements are listed in the metadata file.


Role Variables
--------------

This section should contain a description of the variables that can be set for this role. This includes any variables that are in vars/main.yml, defaults/main.yml, and any variables that the role's parameters can or should set. This section should also include any variables (hostvars, group vars, etc.) that are read from other roles and/or the global scope.

- **port_sequence**: array of ports that builds the knocking sequence (Example: *[24334,34534,2287]*) **Mandatory**
- **secure_ports**: array of ports to enable after a successful knocking sequence (Example: *[22]*) **Mandatory**
- **command_line_options**: string KNOCKD_OPTS configuration (Example: "-i ens3") **Mandatory**
- **open_ports**: array of ports always available (Example: *[80, 443]*) (Default: [])
- sequence_timeout: number of seconds to be able to introduce the knocking sequence (Default: 15)
- command_timeout: number of seconds to be able to introduce a command (Default: 20)

I recommend to store the `port_sequence` variable in a secure place, like
[Ansible Vault](http://docs.ansible.com/ansible/playbooks_vault.html)

Dependencies
------------

None

Example Playbook
----------------

This is an example of role configuration:

    - hosts: servers
      roles:
         - role: truesysadmin.ansible-role-honey-knock
           vars:
            port_sequence:
              - 24334
              - 34534
              - 2287
            secure_ports:
              - 22
            open_ports:
              - 80
              - 443
            command_line_options: "-i eth0"


License
-------

BSD


Author Information
------------------

Denys Rastiegaiev <daaren@gmail.com>
