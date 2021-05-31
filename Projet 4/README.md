# INSTRUCTIONS USUELLES SUR LA MACHINE VIRTUELLE SOUS VAGRANT

Pour d�marrer la machine : 
vagrant up


Pour red�marrer la machine : 
vagrant reload


Pour la d�marrer en for�ant la provision : 
vagrant up --provision


Pour effectuer la provision sur une machine d�j� d�marr�e : 
vagrant provision


Pour arr�ter la machine : 
vagrant halt


Pour d�truire la machine compl�tement avec message de confirmation : 
vagrant destroy 


Pour d�truire la machine compl�tement sans message de confirmation : 
vagrant destroy -f

# COMMANDES EN SSH

Pour acc�der � la machine en SSH : 
vagrant ssh


Pour savegarder la base de donn�es en ssh : 
sudo sh dbsave.sh


Pour charger la base de donn�es en ssh : 
sudo sh dbload.sh


Pour sauvegarder toute la machine dans son �tat actuel (fichiers + base de donn�es) : 
sudo sh backup.sh


Pour sauvegarder toute la machine dans son �tat actuel (fichiers except� vendor et core + base de donn�es) : 
sudo sh backuplite.sh
