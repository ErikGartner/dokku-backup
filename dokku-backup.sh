#!/usr/bin/env bash

# $1 - dokku command
# $2 - name
# $3 - type
dokku_backup_database() {
  $tmp=$(mktemp)
  dokku $1 > $tmp
  dropbox_uploader.sh upload $tmp $2"/"$3"/"$current_time".bak"
  rm -f $tmp
}

# update to latests version
git pull origin

# set variables
current_time=$(date "+%Y.%m.%d-%H.%M.%S")
tmp=$(mktemp -d)

# do backup
dokku_backup_database "dokku postgres:export treachery2" "treachery" "database"
