#!/usr/bin/env bash

set -u # error out if variable is not set
set -e # exit if returns non true

dirname=$(cd "$(dirname "$0")"; pwd)
source "$dirname/../scripts/_shared.sh"

_install go

# Set up the go path / working environment
export GOPATH=${HOME}/go
export PATH=$GOPATH/bin:$PATH
