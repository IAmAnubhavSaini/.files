#!/usr/bin/env bash

set -euxo pipefail

curl --silent --remote-name https://dl.google.com/go/go1.23.3.linux-amd64.tar.gz 
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.23.3.linux-amd64.tar.gz
echo "export PATH=$PATH:/usr/local/go/bin" >> /etc/profile

