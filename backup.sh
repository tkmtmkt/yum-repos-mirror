#!/bin/bash
REPOS_DIR=~/work/yum.repos
BACKUP_DIR=$REPOS_DIR/backup

while read REPOS
do
  NAME=$(echo $REPOS | sed -e 's/\//_/g')
  echo ">>> backup $NAME"
  tar -g $BACKUP_DIR/backup.snar -C $REPOS_DIR -zcf $BACKUP_DIR/backup-$NAME-`date +%Y%m%d`.tar.gz $REPOS
done <<EOS
pub/Linux/CentOS/7/os
pub/Linux/Fedora/epel/7
pub/Linux/CentOS/7/updates
pub/Linux/CentOS/7/extras
EOS
