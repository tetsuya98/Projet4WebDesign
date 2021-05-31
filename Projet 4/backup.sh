#!/bin/bash

echo "----------------------------------"
echo "Loading settings"
echo "----------------------------------"

. /var/www/settings

echo "----------------------------------"
echo "Running database dump..."
echo "----------------------------------"

if [ ! -d $MYSQL_DB_DUMP_DIRECTORY ];
then
	mkdir $MYSQL_DB_DUMP_DIRECTORY
fi	

if [ ! -f $MYSQL_DB_CURRENT_DUMP ];
then
  mysqldump -u$MYSQL_LOGIN -p$MYSQL_PASSWORD $MYSQL_DB_NAME > $MYSQL_DB_CURRENT_DUMP
  if [ -f $MYSQL_DB_CURRENT_DUMP ];
  then 
    cp -f $MYSQL_DB_CURRENT_DUMP $MYSQL_DB_DUMP
    echo "Database dump complete !"
    echo "The related file location is : $MYSQL_DB_CURRENT_DUMP"
  else 
    echo "Operation aborted (code 1) !"
  fi
else
  echo "The file $MYSQL_DB_CURRENT_DUMP already exists !"
  echo "Operation aborted (code 2) !"
fi	

echo "----------------------------------"
echo "Creating archive : "
echo "$VAGRANT_BACKUP_FILE_NAME"
echo "----------------------------------"

echo "Please wait while processing... "

if [ ! -d $VAGRANT_BACKUP_DIRECTORY ];
then
	mkdir $VAGRANT_BACKUP_DIRECTORY
fi	

cd $VAGRANT_BACKUP_DIRECTORY

tar -czf $VAGRANT_BACKUP_FILE_NAME $VAGRANT_BACKUP_PROCESSED_FILES

if [ -f $VAGRANT_BACKUP_FILE_NAME ];
then
  echo "----------------------------------"
  echo "$VAGRANT_BACKUP_FILE_NAME created !"
  echo "----------------------------------"
else
  echo "Operation aborted (code 3) !"
fi
