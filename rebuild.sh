#!/bin/bash

set -xe

sudo nixos-rebuild switch --flake .#$(hostname)
