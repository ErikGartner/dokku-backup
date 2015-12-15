#!/usr/bin/env bash

# $1 - dokku command
# $2 - name
# $3 - type
dokku_backup_database() {
  tmp=$(mktemp)
  dokku $1 > $tmp
  msg=$(dropbox_uploader.sh -f $DB_CONFIG_PATH upload $tmp $2"/"$3"/"$current_time".bak")
  echo $msg
  pushover.sh -T $PO_TOKEN -U $PO_USER -t "Dokku-backup" $msg
  rm -f $tmp
}

echo "Starting Dokku-backup script!"

# update to latests version. affects next run only however.
git pull origin

# set variables
source env.sh
current_time=$(date "+%Y.%m.%d-%H.%M.%S")

# do backup
dokku_backup_database "dokku postgres:export treachery2" "treachery" "postgres"
dokku_backup_database "dokku mongo:export randy2" "randy" "mongo"
dokku_backup_database "dokku mongo:export ghostdoc" "ghostdoc" "mongo"
