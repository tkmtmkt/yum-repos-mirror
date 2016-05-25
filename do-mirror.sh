#!/bin/bash
REPOS_DIR=$(cd $(dirname $0);pwd)
SERVER=http://ftp.jaist.ac.jp

while read REPOS
do
  echo ">>> download $REPOS"
  lftp -e "mirror --delete --only-newer -X */debug/* $REPOS $REPOS_DIR$REPOS && exit" $SERVER
done <<EOS
/pub/Linux/CentOS/7/os/x86_64/
/pub/Linux/Fedora/epel/7/x86_64/
/pub/Linux/CentOS/7/updates/x86_64/
/pub/Linux/CentOS/7/extras/x86_64/
EOS
