#!/usr/bin/env bash

set -u # error out if variable is not set
set -e # exit if returns non true

cd "$(dirname "$0")"/..

# find the installers and run them iteratively
git ls-tree --name-only -r HEAD | grep install.sh | while read -r installer; do
	echo "› ${installer}..."
	sh -c "$installer"
done
