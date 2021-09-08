/etc/init.d/mariadb setup
/etc/init.d/mariadb restart
mysql -u root -e "CREATE USER 'ayoub'@'%' IDENTIFIED BY 'ayoub';" && mysql -u root -e "CREATE DATABASE wordpress;" && mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'ayoub'@'%';" && mysql --user=root wordpress < data.sql &&  mysql -u root -e "FLUSH PRIVILEGES;"
sed -i "s/skip-networking/# skip-networking/g" /etc/my.cnf.d/mariadb-server.cnf
/usr/bin/supervisord