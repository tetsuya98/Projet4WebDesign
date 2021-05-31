### Projet 4 Web Design
## Vitrine MIAGE

# URL du site
- https://drupal.jabel.ovh/

## Logiciels et Version
- Drupal 9.1.3
- PHP 7.3.12
- Vagrant 2.2.15
- MariaDB
- VirtualBox 6.1.22
- Wamp 4.9.12

## Thème Drupal
Pour ce site, nous avons utilisé le thème Bootstrap Barrio. C’est un thème basé sur le framework Bootstrap 4.
Nous avons créé un thème personnalisé à partir de Barrio et l’avons adapté.
Nous avons utilisé les modules suivants :
- View Bootstrap
- Panel Button
- Color Button
- Editor File
- Entity Clone

## Installation 
Logiciel à installer au préalable

# VirtualBox
Télécharger VirtualBox : https://www.virtualbox.org
Une installation de VirtualBox avec une version 6.x ou ultérieure est requise.

# Desactiver Hyper-V
- Allez dans le Panneau de Configuration → Programme → Activer ou désactiver les fonctionnalités Windows.
- Désélectionner les Paramètres Hyper-V dans les fonctionnalités Windows, puis cliquez sur OK.
- “Fonctionnalités de Windows” appliquera les modifications et vous demandera de redémarrer votre machine. Cliquez sur redémarrer.

# Vagrant
Téléchargez Vagrant : https://www.vagrantup.com

Après l’installation, décompressez le projet drupal-vagrant.zip dans un dossier. Puis accédez au Terminal Windows (PowerShell) et tapez "vagrant up"

L’installation peut prendre quelques minutes. Après l’installation, vous avez un dossier contenant le projet. Un copie de ce projet est sur VirtualBox.

## Configurer la BD

# Configurer
Lancez phpMyAdmin sur votre serveur Wamp.
Par défaut, sous Wamp :
- Utilisateur : root
- Mot de passe : (aucun)
Si vous n’avez pas de mot de passe, créez-en un.

# Importer la BD
- Créez une nouvelle base de données nommée m2_miage.
- Allez dans l'onglet Importer. Ajoutez le fichier “m2_miage.sql”. 
- Cliquez sur Exécuter.

Voici le liens d’accès au Site (hébergé en local) : http://localhost:8090/

## Utilisation du Site

# Connexion
Cliquez sur ‘Se connecter’ en bas du footer du site.
- User : admin
- Password : miage

# Navigation
La barre de navigation et le footer contiennent tous les liens pour naviguer dans le site ou vers les sources et annexes.

# Ajouter une offre ou un article
- Se rendre dans l’onglet “Contenu”
- Cliquez sur Article ou Offre de stages/emplois
- Remplir l’offre ou l’article puis cliquer sur “Enregistrer”. L’élément sera alors enregistré et apparaîtra sur la page adéquate.

# Ajouter une image dans le carousel
Se rendre dans l’onglet “Contenu” et cliquer sur "Élément pour carrousel".

# Supprimer un élément du site
- Pour supprimer un élément (article, offre, carrousel...), se rendre dans l’onglet “Contenu” et dérouler le menu modifier.
- Cliquer sur “Supprimer”.