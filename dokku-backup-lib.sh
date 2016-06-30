#!/usr/bin/env bash
source ./env.sh
current_time=$(date "+%Y.%m.%d-%H.%M.%S")

# $1 - dokku command
# $2 - name
# $3 - type
# $4 - report to pushover
dokku_backup_database() {
  tmp=$(mktemp)
  dokku $1 > $tmp
  msg=$(dropbox_uploader.sh -f $DB_CONFIG_PATH upload $tmp $2"/"$3"/"$current_time".bak")
  if [ $4 -eq 1 ]; then
    pushover.sh -T $PO_TOKEN -U $PO_USER -t "Dokku-backup: "$2 $msg
  fi
  echo $msg
  rm -f $tmp
}

echo "Starting Dokku-backup with timestamp: "$current_time
