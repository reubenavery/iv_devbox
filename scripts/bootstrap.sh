#!/usr/bin/env bash

rpm -Uvh http://repo.webtatic.com/yum/centos/5/latest.rpm
yum update
yum -y install gcc make pcre-devel pcre openssl-devel autoconf libtool bison flex bzip2-devel
yum -y --enablerepo=webtatic install git

cd /usr/src

if [[ ! -d tokyocabinet ]]; then
  curl http://fallabs.com/tokyocabinet/tokyocabinet-1.4.48.tar.gz | tar xz
fi

cd tokyocabinet-1.4.48
./configure
make
make install

cd ..

if [[ ! -d cfengine ]]; then 
  git clone git://github.com/cfengine/core.git cfengine
  cd cfengine
  git checkout 3.4.1e
else 
  cd cfengine
  git pull
fi

./autogen.sh
make
make install
/var/cfengine/bin/cf-key
echo 'PATH=$PATH:/var/cfengine/bin' > /etc/profile.d/cfengine.sh

