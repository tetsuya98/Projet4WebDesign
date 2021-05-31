#!/bin/bash

echo "----------------------------------"
echo "Loading settings"
echo "----------------------------------"

. /var/www/settings

echo "----------------------------------"
echo "Loading database dump..."
echo "----------------------------------"

if [ -f $MYSQL_DB_DUMP ];
then
  mysql -u$MYSQL_LOGIN -p$MYSQL_PASSWORD $MYSQL_DB_NAME < $MYSQL_DB_DUMP
else
  echo "The file $MYSQL_DB_DUMP not exists !"
  echo "Operation aborted (code 1) !"
fi
