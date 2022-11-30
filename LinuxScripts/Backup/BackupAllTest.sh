#########################################
# Se non esiste creo una cartella il cui nome sarà la data del backup in formato DDmmYY
# Backup di tutti i file che si trovano nella cartella source 
#########################################

# Uso una cartella di appoggio, se non esiste la creo
# se già esiste ne pulisco il contenuto
# In rootPath inserire il path assoluto in cui si troverà la cartella tmp
roothPath=/Users/claudiodesimone/Desktop
date=$(date +%d%m%y)

source_folder=${roothPath}/tmp/source #cartella che conterrà i file di cui voglio fare il backup
backupFolder_folder=${roothPath}/tmp/backup/${date} #cartella di backup

if ! [ -d "${backupFolder_folder}" ]; then 
    mkdir -p ${backupFolder_folder}
fi

cp -rf ${source_folder}/* ${backupFolder_folder}