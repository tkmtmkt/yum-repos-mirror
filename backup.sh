#!/bin/bash
REPOS_DIR=~/work/yum.repos
BACKUP_DIR=$REPOS_DIR/backup

やりかけ

while read REPOS
do
  tar -g $BACKUP_DIR/backup.snar -C $REPOS_DIR -zcf $BACKUP_DIR/backup-hoge-`date +%Y%m%d`.tar.gz $REPOS
done <<EOS
pub/Linux/CentOS/7/os/x86_64
pub/Linux/Fedora/epel/7/x86_64
pub/Linux/CentOS/7/updates/x86_64
pub/Linux/CentOS/7/extras/x86_64
EOS
