#!/bin/bash
REPOS_DIR=$(cd $(dirname $0);pwd)
BACKUP_DIR=$REPOS_DIR/backup

[ ! -d $BACKUP_DIR ] && mkdir -p $BACKUP_DIR

while read REPOS
do
  NAME=$(echo $REPOS | sed -e 's/\//_/g')
  BACKUP_SNAR=$BACKUP_DIR/backup-$NAME.snar
  BACKUP_FILE=$BACKUP_DIR/backup-$NAME-`date +%Y%m%d`.tar.gz
  echo ">>> backup $NAME"
  tar -g $BACKUP_SNAR -C $REPOS_DIR -zcf $BACKUP_FILE $REPOS
done <<EOS
pub/Linux/CentOS/7/os
pub/Linux/Fedora/epel/7
pub/Linux/CentOS/7/updates
pub/Linux/CentOS/7/extras
EOS
