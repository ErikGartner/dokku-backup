#!/usr/bin/env bash

echo "Setting up requirements..."
git clone https://github.com/andreafabrizi/Dropbox-Uploader.git /opt/
ln -s /opt/Dropbox-Uploader/dropbox_uploader.sh /usr/local/bin/dropbox_uploader.sh

echo "Configuring requirements"
/usr/local/bin/dropbox_uploader.sh
