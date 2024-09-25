#!/bin/bash

# Kontrolli, kas fail "inimesed" on antud
if [ ! -f "../konveier/inimesed" ]; then
    echo "Faili 'inimesed' ei leitud!"
    exit 1
fi

#Eesnimed
cut -f1 -d';' ../konveier/inimesed | cut -f2 -d',' | tr '[:upper:]' '[:lower:]' > ../konveier/eesnimed

#Perenimed
cut -f1 -d';' ../konveier/inimesed | cut -f1 -d',' | tr '[:upper:]' '[:lower:]' > ../konveier/perenimed

#Domeenid
cut -f2 -d';' ../konveier/inimesed > ../konveier/domeenid

#Loo kasutajate fail
paste -d '.' ../konveier/eesnimed ../konveier/perenimed > ../konveier/kasutajad

#Loo meilide fail
paste -d '@' ../konveier/kasutajad ../konveier/domeenid > ../konveier/meilid
