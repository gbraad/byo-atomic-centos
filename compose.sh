#!/bin/sh

pushd /home/working

git clone https://github.com/CentOS/sig-atomic-buildscripts \
    -b downstream \
    --depth 1 \
    centos-atomic

rpm-ostree compose tree \
    --repo=/srv/repo \
    ./centos-atomic/centos-atomic-host.json

find /srv/repo/ -type f | ./genindex.sh > /srv/repo/index.html

popd