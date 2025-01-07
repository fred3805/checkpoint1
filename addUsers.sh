#!/bin/bash

#Création automatique des utilisateurs

#vérifications de la présence d'arguments sinon renvoie un message d'erreur
if [ $# -eq 0 ];
then
  echo "Il manque les nom d'utilisateurs en argument - Fin du script"
  exit 1
fi

#vérifications de l'existence des utilisateurs sinon message d'erreur indiquant l'existence
for utilisateur in $@;
do
  if cat /etc/passwd | grep -q "^$utilisateur:";
  then
    echo "l'utilisateur $utilisateur existe déjà"
  else
    useradd $utilisateur

#confirmation que l'utilisateur a bien été créé
    if [ $? -eq 0 ];
    then
      echo "l'utilisateur $utilisateur a bien été créé"
    else
      echo "Erreur à la création de l'utilisateur $utilisateur"
    fi
  fi
done

