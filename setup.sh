#!/usr/bin/env bash

echo "Setting up requirements..."
git clone https://github.com/andreafabrizi/Dropbox-Uploader.git /opt/
ln -s /opt/Dropbox-Uploader/dropbox_uploader.sh /usr/local/bin/dropbox_uploader.sh

git clone https://github.com/jnwatts/pushover.sh.git /opt/pushover
chmod +x /opt/pushover/pushover.sh
ln -s /opt/pushover/pushover.sh /usr/local/bin/pushover.sh

ln -s ./dokku-backup.sh /usr/local/bin/dokku-backup.sh

echo "Configuring requirements"
/usr/local/bin/dropbox_uploader.sh
