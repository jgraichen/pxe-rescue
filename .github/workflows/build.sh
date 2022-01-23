#!/bin/bash

set -x

sudo apt-get install --quiet --yes python3-ruamel.yaml squashfs-tools-ng mmdebstrap debian-archive-keyring

mkdir bin/
wget -O bin/bdebstrap https://raw.githubusercontent.com/bdrung/bdebstrap/v0.4.0/bdebstrap
wget -O bin/mmdebstrap https://gitlab.mister-muffin.de/josch/mmdebstrap/raw/tag/0.7.5/mmdebstrap
chmod +x bin/*

export PATH="bin/:$PATH"
bdebstrap --force --config rescue.yml
