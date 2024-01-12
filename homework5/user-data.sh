#!/usr/bin/env bash

# Create config directory
mkdir -p /home/ubuntu/.config/systemd/user/

# Create systemd config
cat <<EOF >>/home/ubuntu/.config/systemd/user/file_mover.service
[Unit]
Description=File Mover Service

[Service]
Type=simple
ExecStart=/home/ubuntu/file_mover.sh

[Install]
WantedBy=default.target
EOF

# Add systemd config
cat <<EOF >>/home/ubuntu/file_mover.sh 
#!/bin/bash

# File Mover Script
# Moves new files from folder1 to folder2

FOLDER1="/home/ubuntu/folder1"
FOLDER2="/home/ubuntu/folder2"

while true; do
  # Check for new files in folder1
  if [ "\$(ls -A \$FOLDER1)" ]; then
    # Move files from folder1 to folder2
    mv "\$FOLDER1"/* "\$FOLDER2/"
  fi

  # Sleep for a while before checking again (adjust as needed)
  sleep 60
done
EOF

# Create folders
mkdir /home/ubuntu/folder1 /home/ubuntu/folder2

# Create empty files in folder1
touch /home/ubuntu/folder1/file1 /home/ubuntu/folder1/file2

# Since all the commands above have been issued as root we're changing user and group of all files and dirs to ubuntu
chown -R ubuntu:ubuntu /home/ubuntu/

# Make file_mover.sh executable for all
chmod a+x /home/ubuntu/file_mover.sh

# Run commands as ubuntu user
su ubuntu -c 'systemctl --user enable file_mover'
su ubuntu -c 'systemctl --user daemon-reload'
su ubuntu -c 'systemctl --user start file_mover'
