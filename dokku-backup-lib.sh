# set variables
source env.sh
current_time=$(date "+%Y.%m.%d-%H.%M.%S")

# $1 - dokku command
# $2 - name
# $3 - type
dokku_backup_database() {
  tmp=$(mktemp)
  dokku $1 > $tmp
  msg=$(dropbox_uploader.sh -f $DB_CONFIG_PATH upload $tmp $2"/"$3"/"$current_time".bak")
  echo $msg
  pushover.sh -T $PO_TOKEN -U $PO_USER -t "Dokku-backup: "$2 $msg
  rm -f $tmp
}

echo "Starting Dokku-backup with timestamp: "$current_time
