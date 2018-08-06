CREATE USER 'radius'@'api' IDENTIFIED BY 'badam';
CREATE USER 'radius'@'freeradius-sql' IDENTIFIED BY 'badam';
GRANT ALL PRIVILEGES ON *.* TO 'radius'@'api'
      WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'radius'@'freeradius-sql'
      WITH GRANT OPTION;
