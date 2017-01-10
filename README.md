[![Build Status](https://travis-ci.org/jgeusebroek/ansible-role-docker.svg?branch=master)](https://travis-ci.org/jgeusebroek/ansible-role-docker)

# Ansible role: docker

An Ansible Role that installs and configures Docker Engine on RedHat/CentOS or Debian/Ubuntu.

Tested on CentOS 7, Debian 7 / 8 and Ubuntu 14.04 / 16.04.

## Requirements

Kernel requirements differ per distribution flavour. This role will check for a minumum version before installing. By default this is set to `3.10`. This can be overridden by the `docker_minimal_kernel_version` variable.

## Dependencies

None

## Example Playbook

    ---
    - hosts: all
      sudo: yes

      roles:
         - { role: jgeusebroek.docker, tags: ["docker"] }

## Example Variables

	docker_create_group: False
	docker_group_id: 797

Optionally create a system group named docker with the specified group ID. Please note that a docker group will *always* be created by the docker packages, this setting however gives you control over the group id.

    docker_opts: ''

Use this to set your custom daemon options. Have a look at [https://docs.docker.com/engine/reference/commandline/daemon/](https://docs.docker.com/engine/reference/commandline/daemon/) for available options.

	docker_tls_enable: True

When TLS is enabled it expects a dict named `docker_tls_keys` with the required private key, certificate, and certificate authority. See example below.

Furthermore, **it automaticly appends** the required configuration values to the `docker_opts` variable.

	-H tcp://0.0.0.0:2376 --tlsverify --tlscacert=/etc/docker/ca.crt \
	--tlscert=/etc/docker/server.crt --tlskey=/etc/docker/server.key

The port and the IP can be overridden.

	docker_tls_bind: '0.0.0.0'
	docker_tls_port: 2376

Have a look at [https://docs.docker.com/engine/security/https/](https://docs.docker.com/engine/security/https/) for the official docker documentation.

	docker_tls_keys:
	  ca_cert: |
	    -----BEGIN CERTIFICATE-----
	    MIID3DCCAsSgAwIBAgIBDjANBgkqhkiG9w0BAQsFADCBkDELMAkGA1UEBhMCTkwx
		<SNIP>
	    dGgQoKkv/6N6WVIUv6tBSnFr3Y45m2pI8LkJdzj1jIY=
	    -----END CERTIFICATE-----
	  server_cert: |
	    -----BEGIN CERTIFICATE-----
	    MIIDVzCCAj+gAwIBAgIJAMheQWrfic0jMA0GCSqGSIb3DQEBBQUAMF4xCzAJBgNV
		<SNIP>
	    /VomEerTmZQG9EmiU5bqxz8pMw8QJQe1SgNlhnESsMeLWbk0appccEaMxg==
	    -----END CERTIFICATE-----
	  server_key: |
	    -----BEGIN RSA PRIVATE KEY-----
	    MIIEowIBAAKCAQEAvf19krdj5YVH5xoG3CiTxdE5Xzn9kGsrzc7hoFQjfWH5viaA
		<SNIP>
	    xUXH/vsT27s57A9rtDFBtF2tJoBqvhMMzg3pKhhyRebuPgb3Zoi6
	    -----END RSA PRIVATE KEY-----

The minimum kernel version requirement can be overridden:

	docker_minimal_kernel_version: '3.13'

## License

MIT / BSD

## Author Information

By [Jeroen Geusebroek](http://jeroengeusebroek.nl/) 2016 - 2017.