#!/usr/bin/env bash
cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
git pull origin
source dokku-backup-lib.sh

# Below you write your backup commands
#
# For example:
# dokku_backup_database "dokku mongo:export ghostdoc" "ghostdoc" "mongo"
