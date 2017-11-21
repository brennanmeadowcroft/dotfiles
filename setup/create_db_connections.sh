#! /bin/bash

DB_FOLDER=~/.dbext-connections
DB_VIM_FILE=$DB_FOLDER/dbext-connections.vim
PG_PASS_FILE=$DB_FOLDER/.pgpass

ls $DB_FOLDER
echo $DB_VIM_FILE
echo $PG_PASS_FILE
#echo 'Creating folder and files to connect to databases'
mkdir -p $DB_FOLDER
#touch $DB_VIM_FILE
#touch $PG_PASS_FILE

if [ ! -e "$DB_VIM_FILE" ] ; then
  echo "$DB_VIM_FILE not found.  Creating it."
  touch "$DB_VIM_FILE"
  echo "\"Sample dbext connections:" >> $DB_VIM_FILE
  echo "\"let g:dbext_default_profile_psql = 'type=PGSQL:host=localhost:port=5433:dbname=jms:user=jms" >> $DB_VIM_FILE
  echo "\"let g:dbext_default_profile = 'psql'" >> $DB_VIM_FILE
fi

if [ ! -e "$PG_PASS_FILE" ] ; then
  echo "$PG_PASS_FILE not found.  Creating it."
  touch $PG_PASS_FILE
  echo '#Sample password format: hostname:port:database:username:password' >> $PG_PASS_FILE
fi

echo "dbext.vim basic setup complete!"

