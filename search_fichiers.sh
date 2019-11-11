#!/bin/bash

echo "Bienvenue $USERNAME, nous sommes le $(date +%d) $(date +%B) $(date +%Y)"
read -p "Quel répertoire vous intéresse aujourd'hui ? " repertoire
res=$(find / -name "$repertoire" -type d 2>/dev/null)
if [ "$res" == "" ]
then
        echo "pas de repertoire existant contenant $repertoire "
else
        echo "$res"
fi









