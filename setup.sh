#!/usr/bin/env bash

echo "configuring requirements"
./Dropbox-Uploader/dropbox_uploader.sh

ln -s ./dokku-backup.sh /usr/local/bin/dokku-backup.sh
