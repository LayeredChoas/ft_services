wget https://dl.influxdata.com/telegraf/releases/telegraf-1.16.1_linux_amd64.tar.gz
tar xf telegraf-1.16.1_linux_amd64.tar.gz
mv telegraf-1.16.1 telegraf
openrc
touch /run/openrc/softlevel
service influxdb start
sleep 5
influx << EOF
CREATE DATABASE Influx_data;
CREATE USER "ayoub" WITH PASSWORD 'mypassword' WITH ALL PRIVILEGES;
GRANT ALL ON Influx_data TO ayoub;
EOF