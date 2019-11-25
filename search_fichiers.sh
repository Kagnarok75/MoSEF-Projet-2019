#!/bin/bash

echo "Bienvenue $USERNAME, nous sommes le $(date +%d) $(date +%B) $(date +%Y)"
read -p "Quel répertoire vous intéresse aujourd'hui ? " repertoire
res=$(find / -name "$repertoire" -type d 2>/dev/null)
if [ "$res" == "" ]
then
        echo  "pas de chemin existant contenant $repertoire "
else
	echo   "Voici le(s) chemin(s) correspondant(s): $res"
fi

if [ -n "$2" ]
then
	echo "Voici le(s) fichier(s) contenant le texte renseigné : "
	find ${res} -name $1 -name $1 -exec grep -il $2 {} \;
elif [ -n "$1" ] && [ -z "$2" ]
then
	echo "Voici le(s) fichier(s) recherché(s) : "
	find ${res} -name $1
fi










