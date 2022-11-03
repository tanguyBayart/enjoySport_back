#! /bin/sh
TZ='Europe/Paris';
echo "### deployEnjoySportBack.sh - `date` - Lancement du déploiement de EnjoySportBack"
. $HOME/.bashrc

# récupération des sources
echo "### deployEnjoySportBack.sh - `date` - récupération de sources"
cd /home/iaam4644/EJ2repo/enjoySport_back
git reset --hard
git pull https://github.com/tanguyBayart/enjoySport_back.git main
echo "### deployEnjoySportBack.sh - `date` - récupération de sourceses"

## npm install
# npm i (TODO?)

# deploiment date and version )) TODO in deployEnjoySport.sh


# nettoyage/déploiement
echo "### deployEnjoySportBack.sh - `date` - Nettoyage d'Apache (back seulement (/esb)"
rm -r ../../public_html/esb/*
echo "### deployEnjoySportBack.sh - `date` - Apache nettoye"


echo "### deployEnjoySportBack.sh - `date` - Début du déploiement"
cp -r * ../../public_html/esb

echo "### deployEnjoySportBack.sh - `date` - Fin du déploiement"


echo "### deployEnjoySportBack.sh - `date` - Redemarrage d'Apache"
sudo service httpd stop > /dev/null 2>&1
sudo service httpd start > /dev/null 2>&1


echo "### deployEnjoySportBack.sh - `date` - Application déployée"
