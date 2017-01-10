#!/bin/bash
set -e # exit on error
set -x

if ! command -v ansible >/dev/null; then

  echo "Installing Ansible dependencies and Git."
  sudo apt-get update
  sudo apt-get install -y software-properties-common
  sudo apt-add-repository ppa:ansible/ansible -y
  sudo apt-get update
  sudo apt-get install -y ansible
  if ! command -v ansible >/dev/null; then
    exit 1
  fi
fi

