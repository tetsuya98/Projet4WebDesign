#!/bin/bash

echo "----------------------------------"
echo "Loading settings"
echo "----------------------------------"

. /var/www/settings

echo "----------------------------------"
echo "debconf-set-selections MySQL"
echo "----------------------------------"

debconf-set-selections <<< "mysql-server-$MYSQL_VERSION mysql-server/root_password password $MYSQL_PASSWORD"
debconf-set-selections <<< "mysql-server-$MYSQL_VERSION mysql-server/root_password_again password $MYSQL_PASSWORD"

echo "----------------------------------"
echo "debconf-set-selections PhpMyAdmin"
echo "----------------------------------"

debconf-set-selections <<< "phpmyadmin phpmyadmin/dbconfig-install boolean true"
debconf-set-selections <<< "phpmyadmin phpmyadmin/app-password-confirm password $MYSQL_PASSWORD"
debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/admin-pass password $MYSQL_PASSWORD"
debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/app-pass password $MYSQL_PASSWORD"
debconf-set-selections <<< "phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2"

echo "----------------------------------"
echo "Installing ubuntu latest packages"
echo "----------------------------------"

apt-get update
apt-get upgrade

echo "----------------------------------"
echo "Adding PPA for PHP"
echo "----------------------------------"

apt-get install software-properties-common
add-apt-repository ppa:ondrej/php
apt-get update

echo "----------------------------------"
echo "Installing essentials"
echo "----------------------------------"

apt-get install -y curl git zip bindfs

echo "----------------------------------"
echo "Installing Apache"
echo "----------------------------------"

apt-get install -y apache2 libapache2-mod-php$PHP_VERSION

echo "----------------------------------"
echo "Installing PHP $PHP_VERSION"
echo "----------------------------------"

apt-get -y install php$PHP_VERSION
php -v

echo "----------------------------------"
echo "Installing PHP required extensions"
echo "----------------------------------"

apt-get install -y php$PHP_VERSION-xml php$PHP_VERSION-gd php$PHP_VERSION-json php$PHP_VERSION-curl php$PHP_VERSION-mbstring

echo "----------------------------------"
echo "Installing PHP common extensions"
echo "----------------------------------"

apt-get install -y php$PHP_VERSION-cli php$PHP_VERSION-common php$PHP_VERSION-intl
apt-get install -y php$PHP_VERSION-xmlrpc php$PHP_VERSION-imagick  php$PHP_VERSION-dev php$PHP_VERSION-imap php$PHP_VERSION-opcache php$PHP_VERSION-soap php7.1-mcrypt php$PHP_VERSION-gettext php$PHP_VERSION-zip php$PHP_VERSION-bz2

echo "----------------------------------"
echo "Installing mysql"
echo "----------------------------------"

apt-get install -y mysql-server-$MYSQL_VERSION php$PHP_VERSION-mysql

echo "----------------------------------"
echo "Installing phpmyadmin"
echo "----------------------------------"

apt-get install -y phpmyadmin

echo "----------------------------------"
echo "Writing Apache settings"
echo "----------------------------------"

echo "
<VirtualHost *:80>
  ServerName $APPLICATION_NAME.local
  ServerAdmin $APPLICATION_EMAIL
  DocumentRoot $APPLICATION_DOCUMENT_ROOT
  AllowEncodedSlashes On
    
  CustomLog ${APACHE_LOG_DIR}/access.log combined
  ErrorLog ${APACHE_LOG_DIR}/error.log
  
  <Directory $APPLICATION_DOCUMENT_ROOT>
    Options -Indexes +FollowSymLinks
    DirectoryIndex index.php index.html
    Order allow,deny
    Allow from all
    AllowOverride All
  </Directory>
</VirtualHost>
" > /etc/apache2/sites-available/drupal.conf

sed -i.bak 's/display_errors = Off/display_errors = On/g' /etc/php/$PHP_VERSION/apache2/php.ini

a2enmod rewrite
a2dissite 000-default.conf
a2ensite drupal.conf
systemctl reload apache2

if [ -d $VAGRANT_ROOT/html ];
then
  echo "----------------------------------"
  echo "Deleting unused $VAGRANT_ROOT/html directory"
  echo "----------------------------------"
  
  rm -rf $VAGRANT_ROOT/html
fi

if ! grep -q "cd $VAGRANT_ROOT" /home/vagrant/.profile; 
then
  echo "----------------------------------"
  echo "Reseting vagrant user home directory"
  echo "----------------------------------"
  
  echo "cd $VAGRANT_ROOT" >> /home/vagrant/.profile
fi

if [ ! -f /var/log/databasesetup ];
then
  echo "----------------------------------"
  echo "Creating database"
  echo "----------------------------------"
  
  echo "CREATE USER '$MYSQL_DB_LOGIN'@'$MYSQL_HOST' IDENTIFIED BY '$MYSQL_DB_PASSWORD'" | mysql -u$MYSQL_LOGIN -p$MYSQL_PASSWORD
  
  echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DB_NAME DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci" | mysql -u$MYSQL_LOGIN -p$MYSQL_PASSWORD
  
  echo "GRANT ALL ON $MYSQL_DB_NAME.* TO '$MYSQL_DB_LOGIN'@'$MYSQL_HOST'" | mysql -u$MYSQL_LOGIN -p$MYSQL_PASSWORD
  
  echo "FLUSH PRIVILEGES" | mysql -u$MYSQL_LOGIN -p$MYSQL_PASSWORD

  touch /var/log/databasesetup

  if [ -f $MYSQL_DB_DUMP ];
  then
    echo "----------------------------------"
    echo "Loading database dump..."
    echo "----------------------------------"
    
    mysql -u$MYSQL_LOGIN -p$MYSQL_PASSWORD $MYSQL_DB_NAME < $MYSQL_DB_DUMP
  fi
  
  # Fix warning in ./libraries/sql.lib.php#613 count(): 
  # Parameter must be an array or an object that implements Countable
  sed -i "s/|\s*\((count(\$analyzed_sql_results\['select_expr'\]\)/| (\1)/g" /usr/share/phpmyadmin/libraries/sql.lib.php
fi

if [ -e /usr/local/bin/composer ]; 
then
  echo "----------------------------------"
  echo "Updating Composer"
  echo "----------------------------------"
  
  composer self-update --$COMPOSER_VERSION
else
  echo "----------------------------------"
  echo "Installing Composer"
  echo "----------------------------------"
  
  curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
  ln -s /usr/local/bin/composer /usr/bin/composer
  composer self-update --$COMPOSER_VERSION
  composer --version
fi

if [ ! -d $APPLICATION_DIRECTORY ];
then
  echo "----------------------------------"
  echo "Installing Drupal $APPLICATION_DRUPAL_VERSION"
  echo "----------------------------------"

	mkdir $APPLICATION_DIRECTORY
	cd $APPLICATION_DIRECTORY
  
  echo "----------------------------------"
  echo ">>>> Creating Drupal project"
  echo "----------------------------------"
  
  export COMPOSER_ALLOW_SUPERUSER=1
  export COMPOSER_PROCESS_TIMEOUT=1200
  composer create-project --prefer-source drupal/recommended-project:$APPLICATION_DRUPAL_VERSION .
  
  echo "----------------------------------"
  echo ">>>> Installing Drush Launcher"
  echo "----------------------------------"
  
	mkdir /usr/local/src/drush
  cd /usr/local/src/drush
  wget -O drush.phar https://github.com/drush-ops/drush-launcher/releases/latest/download/drush.phar
  chmod +x drush.phar
  mv drush.phar /usr/local/bin/drush
  drush self-update
  
  echo "----------------------------------"
  echo ">>>> Installing Drush"
  echo "----------------------------------"

 	cd $APPLICATION_DIRECTORY
  composer require --prefer-source drush/drush:$APPLICATION_DRUPAL_DRUSH_VERSION
  drush init
  drush --version
  
  echo "----------------------------------"
  echo ">>>> Installing site with Drush"
  echo "----------------------------------"
  
 	cd $APPLICATION_DIRECTORY
  drush si standard --db-url=\
  "mysql://$MYSQL_DB_LOGIN:$MYSQL_DB_PASSWORD@$MYSQL_HOST:$MYSQL_PORT/$MYSQL_DB_NAME" \
  --account-name="$APPLICATION_LOGIN" \
  --account-pass="$APPLICATION_PASSWORD" \
  --site-name="$APPLICATION_TITLE" \
  --site-mail="$APPLICATION_EMAIL" \
  --locale="$APPLICATION_LOCALE" \
  --yes
  
  echo "----------------------------------"
  echo ">>>> Installing base theme"
  echo "----------------------------------"
  
  composer require --prefer-source drupal/$APPLICATION_DRUPAL_BASE_THEME
fi

echo "----------------------------------"
echo "Finishing"
echo "----------------------------------"

echo "** Visit $APPLICATION_HOMEPAGE in your browser for to view the application $APPLICATION_TITLE **"
