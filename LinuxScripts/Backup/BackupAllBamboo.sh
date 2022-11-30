date=$(date +%d%m%y)

backupFolder_folder=${bamboo.backup}/${date} 
if ! [ -d "${backupFolder_folder}" ]; then 
    sudo su - ${bamboo.localuser} -c "mkdir -p ${backupFolder_folder}"
fi

sudo su - ${bamboo.localuser} -c "cp -rf ${bamboo.source_folder}/* ${backupFolder_folder}"