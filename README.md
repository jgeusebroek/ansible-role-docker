# Ansible role: docker

An Ansible Role that installs and configures Docker Engine on RedHat/CentOS or Debian/Ubuntu.

Tested on CentOS 7 / Debian 8 and Ubuntu 14.04.

## Requirements

None

## Dependencies

None

## Example Playbook

    ---
    - hosts: all
      sudo: yes

      roles:
         - { role: jgeusebroek.docker, tags: ["docker"] }

## Example Variables

    docker_opts: '-H tcp://0.0.0.0:2375'
      
## License

MIT / BSD

## Author Information

This role was created in 2016 by [Jeroen Geusebroek](http://jeroengeusebroek.nl/).