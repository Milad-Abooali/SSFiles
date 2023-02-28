#!/usr/bin/env bash

# SSFile v 0.1
# by Milad Abooali (m.abooali@hotmail.com)
# developed for Codebox (codebox.ir)
# Last Change 2023-02-28

### This server (local)
server_name="Box-1"
local_path="/etc/test/*"

### Backup Server (remote)
IP="SERVERIP"
password="YOURPASSWORD"
username="root"
remote_folder="/home/backup"

### Sync Files
remote_path="${remote_folder}/${server_name}_"`date +%Y-%m-%d_%H`
sshpass -p "$password" scp -rC $local_path $username@$IP:$remote_path

### Add Log
echo `date +%Y-%m-%d_%H:%M:%S`" Files uploaded from '${local_path}' to '${remote_path}' on remote server: ${server_name} (${IP}) " >> /var/log/ssfile.log
