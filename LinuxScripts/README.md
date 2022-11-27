Qui potrai trovare alcuni esempi di script da utilizzare su server linux.
Per comodità ogni script avrà due versioni, una con lo script da inserire su bamboo e una con un esempio da testare in locale.

Gli script da lanciare saranno quelli il cui nome termina con Test, prima di lanciargli devi cambiargli i permessi( ad esempio con chmod 775 nomeFile.sh)

Gli script da usare in bamboo sono quelli il cui nome termina con Bamboo.
All'interno degli script troverai alcune variabili bamboo.nomeVariabile, queste variabili dovrai dichiararle tra le variabili del d'ambiente del piano di deploy inserendo solo il nomeVariabile e assegnandogli il valore

