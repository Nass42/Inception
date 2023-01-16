# ------------------------------------------- #
#!/bin/sh
touch /run/mysqld/mysqld.sock && chown mysql:mysql /run/mysqld/mysqld.sock
/usr/bin/mysqld --user=mysql &
sleep 5s
mysqladmin --user=mysql -u root password "$DB_ROOT"
mysql --user=mysql -u root -p"$DB_ROOT" -e "CREATE DATABASE $DB_NAME;"
mysql --user=mysql -u root -p"$DB_ROOT" -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';"
mysql --user=mysql -u root -p"$DB_ROOT" -e "FLUSH PRIVILEGES;"
mysql --user=mysql -u root -p"$DB_ROOT" -e "DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
DROP DATABASE test;
FLUSH PRIVILEGES;
GRANT USAGE ON *.* to 'root'@'%' identified by 'DB_ROOT' with grant option;
ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT';
FLUSH PRIVILEGES;"
# ------------------------------------------- #

