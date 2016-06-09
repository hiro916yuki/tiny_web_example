#!/bin/bash
#
# requires:
#  bash
#
set -e
set -o pipefail
set -u
set -x

# required shell params
: "${YUM_HOST:?"should not be empty"}"

# install tiny-web-example.repo
cat <<-EOS > /etc/yum.repos.d/tiny-web-example.repo
[tin-web-example]
name=tiny-web-example
baseurl=http://${YUM_HOST}/pub/
enabled=1
gpgcheck=0
EOS

# show available repo list
yum repolist

# install tiny-web-example.rpm
yum install -y tiny-web-example
