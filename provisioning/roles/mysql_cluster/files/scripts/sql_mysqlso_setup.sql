CREATE USER 'mysqlre'@'%' IDENTIFIED WITH mysql_native_password BY 'mysqlre';
GRANT REPLICATION SLAVE ON *.* TO 'mysqlre'@'%';
FLUSH PRIVILEGES;
