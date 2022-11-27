#definizione variabili
tmp_folder=/tmp/${bamboo.pathCartella}

if [ -d "${tmp_folder}" ]; then
  echo "directory esistente"
  rm -rf ${tmp_folder}/*
else
  echo "creo la directory"
  mkdir -p ${tmp_folder}
fi