# Dokku-backup
*A small backup script for my Dokku installation*

## Installtion:
Use the ```setup.sh``` to install and setup the following requirements.

- [Dropbox Uploader](https://github.com/andreafabrizi/Dropbox-Uploader)
- [pushover.sh](https://github.com/jnwatts/pushover.sh.git)

All tokens are supposed to be stored in env.sh. Edit it to suit your needs.
```
# pushover
export PO_TOKEN="your applications token here"
export PO_USER="your user/group key here"

# Dropbox
export DB_CONFIG_PATH=~/.dropbox_uploader
```
