#variabili da rimuovere
#variabili di bamboo
myRoothPath="/Users/claudiodesimone/Desktop/SoleWebRilasci"
tmp_folder=${myRoothPath}/tmp/bamboo-artifacts
progetto="soleweb"
component="BATCH_DBSERVER"
rootPath="${myRoothPath}/batch_sole_svi"

echo "Eseguo lo script di backup della componente batch"
#definizione variabili
date=$(date +%d%m%y)
#root directory BATCH_DBSERVER
batchDBFolder=${tmp_folder}/${progetto}/${component}
cd ${batchDBFolder}
pwd
ls -la
for progettoBatch in *; do
    echo "progettoBatch: $progettoBatch"
    cd ${progettoBatch}
    folder=$(ls)
    if [ -d "${rootPath}/${folder}" ]; then
        rootFolder="${rootPath}/${folder}"
        cd ${folder}
        echo "the folder is: ${folder}"
        pwd
        ls -la
        selectedFolders=$(ls)
        echo "selectedFolders: $selectedFolders"
        for selectedFolder in ${selectedFolders}; do
            echo "Sono nel for incriminato, : ${rootFolder}/${selectedFolder}"
            if [ -f "${rootFolder}/${selectedFolder}" ]; then
                echo "${selectedFolder} is a file 1"
                mv ${rootFolder}/${selectedFolder} ${rootFolder}/${selectedFolder}_${date}
            elif [ -d "${rootFolder}/${selectedFolder}" ]; then
                echo "${rootFolder}/${selectedFolder} è una directory"
                cd ${selectedFolder}
                pwd
                filesInFolder=$(ls)
                echo "file In folders: ${filesInFolder}"
                for fileInFolder in ${filesInFolder}; do
                    fileInFolderDir="${rootFolder}/${selectedFolder}/${fileInFolder}"
                    echo "nome del file o della directory: ${fileInFolder}: directory: ${fileInFolderDir}"
                    if [ -f "$fileInFolderDir" ]; then
                        echo "${fileInFolder} is a file 2"
                        mv ${fileInFolderDir} ${fileInFolderDir}_${date}
                    elif [ -d "${fileInFolderDir}" ]; then
                    echo "${fileInFolder} is a folder"
                        cd ${fileInFolder}
                        pwd
                        for fileInSubfolder in *; do
                            subFolderPath="${fileInFolderDir}/${fileInSubfolder}"
                            if [ -f "${subFolderPath}/${fileInSubfolder}" ]; then
                                echo "${fileInSubfolder} is a file in subfolder"
                                mv ${subFolderPath} ${subFolderPath}_${date}
                            elif [ -d "${subFolderPath}/${fileInSubfolder}" ]; then
                                echo "${fileInSubfolder} is a folder"
                                cd ${fileInSubfolder}
                                pwd
                                for file in *; do
                                    echo "${file} is a file 3"
                                    if [ -f "${fileInSubfolder}/${file}" ]; then
                                        echo "${fileInSubfolder}/${file} esiste"
                                        mv ${subFolderPath}/${file} ${subFolderPath}/${file}_${date}
                                    fi
                                cd ..
                                done
                            fi
                        done
                        cd ..
                    fi
                done
                cd ..
            else
                echo "non è ne un file ne una directory"
            fi
        done
    else
        echo "${rootPath}/${folder} non è presente sul server"
    fi
done
