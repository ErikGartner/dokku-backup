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

## Restoring
To restore the backups use the Dokku plugin's import command.
```bash
dokku mongo:import <app name> < <path to backup file>
```

**Note** that some there is a difference between the plugin versions of how there are generated. The easiest way to restore the backups are to use the same version, otherwise you need to take care when restoring. For example [older version](https://github.com/dokku/dokku-mongo/blob/b5e587c7177a1969aa3263da482683d08d9620e6/functions) of the Mongo plugin tars the output while [newer](https://github.com/dokku/dokku-mongo/blob/1.3.0/functions) use the built-in gzip flag in Mongo.
