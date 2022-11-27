# Uso una cartella di appoggio, se non esiste la creo
# se già esiste ne pulisco il contenuto

# In rootPath inserire il path assoluto in cui si troverà la cartella tmp
roothPath=/Users/claudiodesimone/Desktop
# in pathCartella inseriò il path della cartella che voglio creare sotto tmp
pathCartella=cartellaTemporanea/claudio
tmp_folder=${roothPath}/tmp/${pathCartella}

if [ -d "${tmp_folder}" ]; then
  echo "directory esistente"
  rm -rf ${tmp_folder}/*
else
  echo "creo la directory"
  mkdir -p ${tmp_folder}
fi