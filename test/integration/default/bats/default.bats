#!/usr/bin/env bats

@test "Checking for docker executable" {
  command -v docker
}
