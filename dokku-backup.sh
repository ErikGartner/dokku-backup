#!/usr/bin/env bash

current_time=$(date "+%Y.%m.%d-%H.%M.%S")
tmp=$(mktemp -d)

dokku postgres:export treachery2 > $tmp"/treachery2_postgres.bak"
dropbox_uploader.sh upload $tmp"/treachery2_postgres.bak" "treachery/postgres_"$current_time".bak"

rm -rf $tmp
