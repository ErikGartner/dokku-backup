#!/usr/bin/env bash
cd "$( dirname "${BASH_SOURCE[0]}" )"
git pull --rebase origin
source ./dokku-backup-lib.sh

# Below you write your backup commands
#
# For example:
# dokku_backup_database "mongo:export <database name>" "<app name>" "<service name>"
