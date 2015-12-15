#!/usr/bin/env bash

# update to latests version
git pull origin

# set variables
current_time=$(date "+%Y.%m.%d-%H.%M.%S")
tmp=$(mktemp -d)

# do backup
dokku postgres:export treachery2 > $tmp"/treachery2_postgres.bak"
dropbox_uploader.sh upload $tmp"/treachery2_postgres.bak" "treachery/postgres_"$current_time".bak"

# clean up
rm -rf $tmp
