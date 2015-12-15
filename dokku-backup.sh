#!/usr/bin/env bash

# $1 - dokku command
# $2 - name
# $3 - type
dokku_backup_database() {
  tmp=$(mktemp)
  dokku $1 > $tmp
  msg=$(dropbox_uploader.sh upload $tmp $2"/"$3"/"$current_time".bak")
  pushover.sh -t "Dokku-backup" $msg
  rm -f $tmp
}

# update to latests version. affects next run only however.
git pull origin

# set variables
current_time=$(date "+%Y.%m.%d-%H.%M.%S")

# do backup
dokku_backup_database "dokku postgres:export treachery2" "treachery" "postgres"
dokku_backup_database "dokku mongo:export randy2" "randy" "mongo"
dokku_backup_database "dokku mongo:export ghostdoc" "ghostdoc" "mongo"
