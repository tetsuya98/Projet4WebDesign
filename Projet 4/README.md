# INSTRUCTIONS USUELLES SUR LA MACHINE VIRTUELLE SOUS VAGRANT

Pour démarrer la machine : 
vagrant up


Pour redémarrer la machine : 
vagrant reload


Pour la démarrer en forçant la provision : 
vagrant up --provision


Pour effectuer la provision sur une machine déjà démarrée : 
vagrant provision


Pour arrêter la machine : 
vagrant halt


Pour détruire la machine complètement avec message de confirmation : 
vagrant destroy 


Pour détruire la machine complètement sans message de confirmation : 
vagrant destroy -f

# COMMANDES EN SSH

Pour accéder à la machine en SSH : 
vagrant ssh


Pour savegarder la base de données en ssh : 
sudo sh dbsave.sh


Pour charger la base de données en ssh : 
sudo sh dbload.sh


Pour sauvegarder toute la machine dans son état actuel (fichiers + base de données) : 
sudo sh backup.sh


Pour sauvegarder toute la machine dans son état actuel (fichiers excepté vendor et core + base de données) : 
sudo sh backuplite.sh
