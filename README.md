# Dokku-backup
*A small backup script for my Dokku installation*

## Installation
Checkout this repository with `git clone --recursive` to get all dependencies.

Use the ```setup.sh``` setup the following requirements.

- [Dropbox Uploader](https://github.com/andreafabrizi/Dropbox-Uploader)
- [pushover.sh](https://github.com/jnwatts/pushover.sh.git)

All tokens are supposed to be stored in ```env.sh```. Edit it to suit your needs.

```
# pushover
export PO_TOKEN="your applications token here"
export PO_USER="your user/group key here"

# Dropbox
export DB_CONFIG_PATH=~/.dropbox_uploader
```

You might also want to add ```dokku-backup.sh``` as a cron job. For example like this with `crontab -e`:
```
0 5 * * 1 /bin/bash /opt/dokku-backup/dokku-backup.sh >> /var/log/dokku-backup.log
```

## Usage
Edit ```dokku-backup.sh``` to add your backup function calls, for example:
```
dokku_backup_database "mongo:export <database name>" "<app name>" "<service name>"
```
