#!/bin/bash
#
# Script to sync CV notes to the webserver.
#
# Samuel Albanie

root_dir=$(pwd)
declare -a topics=("old-ideas" "differentials" "optimization")
target_root="~/WWW/notes"
server="robots-login"

for topic in "${topics[@]}"
do
   src=${root_dir}/${topic}/main.pdf
   target_dir=${target_root}/${topic}
   dest="${target_dir}/main.pdf"
   echo "syncing ${src} to webserver ${dest}"
   ssh $server "mkdir -p ${target_dir}"
   rsync -azvh --perms --chmod=og=rx $src "$server:$dest"
done
