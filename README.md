# MoSEF-Projet-2019
## Karim Alexis BOUABID
Projet Master 2 MoSEF (U. Paris 1)

Salam a tous mes amis.

Voici un projet universitaire dans le cadre d'un cours portant sur Linux et git.

Le but du projet est d'écrire un script *search_fichiers* qui peut s'executer sans argument, avec un argument ou deux arguments.

## pas d'argument : Souhaite la bienvenue de l'utilisateur et demande le dossier recherché.

Lorsque qu'aucun argument n'est entré lors de l'execution du script, ce dernier propose a l'utilisateur de renseigner un nom de dossier qu'il souhaite localiser et si ce dossier existe le resultat affichera tous les chemins contenant ce dossier.
Dans l'exemple suivant l'utilisateur cherche les differents emplacement d'un dossier se nommant "lab1".

![Exemple](https://github.com/Kagnarok75/MoSEF-Projet-2019/blob/master/Images/projet1.png)

## un argument : recherche d'un ou de plusieurs fichiers respectant un pattern particulier.

Lorsqu'un argument est renseigné le but du script est de rechercher dans le dossier qu'on souhaite localiser cette fois ci un fichier respectant un pattern particulier dans son nom.
Dans l'exemple suivant, je donne un premier argument "fichier*" qui indique que je recherche tous les fichiers commençant par "fichier". Puis comme dans le premier exemple le script demande à l'utilisateur dans quel dossier se trouve la recherche.

![Exemple](https://github.com/Kagnarok75/MoSEF-Projet-2019/blob/master/Images/projet2.png)

## deux arguments : recherche d'un texte ecrits dans les fichiers recherchés.

Lorsqu'il y a deux arguments, le premier argument a le meme but que dans le deuxieme exemple, parcontre le deuxieme arguments qui represente une chaine de caractères qu'on recherche va permettre d'avoir en resultat tous les fichiers contenant ce texte. (à noter que le texte recherché est insensible à la casse) 
Dans l'exemple suivant au sein du dossier "lab1" je cherche tous les fichiers ayant comme nom commencant par "fichier" qui contiennent le mot "sorbonne"

![Exemple](https://github.com/Kagnarok75/MoSEF-Projet-2019/blob/master/Images/projet2.png)

Vous pouvez voir le code qui a permit de trouver ces resultats ci dessous :

``` 
#!/bin/bash

echo "Bienvenue $USERNAME, nous sommes le $(date +%d) $(date +%B) $(date +%Y)"
read -p "Quel répertoire vous intéresse aujourd'hui ? " repertoire
res=$(find / -name "$repertoire" -type d 2>/dev/null) # 2>/dev/null --> renvoie les messages d'erreurs dans un "trou noir"
if [ "$res" == "" ] #si la recherche du dossier renvoie un caractere vide donc la non existence de ce dossier
then
        echo  "pas de chemin existant contenant $repertoire "
else
	echo   "Voici le(s) chemin(s) correspondant(s): $res"
fi

if [ -n "$2" ] #si le deuxieme argument a été entré
then
	echo "Voici le(s) fichier(s) contenant le texte renseigné : "
	find ${res} -name $1 -name $1 -exec grep -il $2 {} \;
elif [ -n "$1" ] && [ -z "$2" ] #si le premier argument a été entré mais pas le deuxieme
then
	echo "Voici le(s) fichier(s) recherché(s) : "
	find ${res} -name $1
fi
```
