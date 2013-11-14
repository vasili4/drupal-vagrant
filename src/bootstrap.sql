
-- username USER
GRANT USAGE ON *.* TO 'username'@'localhost'; -- WORKARROUND - WHEN USER DOESNT EXIST
GRANT USAGE ON *.* TO 'username'@'hostname'; -- WORKARROUND - WHEN USER DOESNT EXIST
GRANT USAGE ON *.* TO 'username'@'%'; -- WORKARROUND - WHEN USER DOESNT EXIST
GRANT USAGE ON *.* TO 'username'@'127.0.0.1'; -- WORKARROUND - WHEN USER DOESNT EXIST
DROP USER 'username'@'localhost';
DROP USER 'username'@'%';
DROP USER 'username'@'hostname';
DROP USER 'username'@'127.0.0.1';
FLUSH PRIVILEGES;
CREATE USER 'username'@'127.0.0.1' IDENTIFIED BY 'password';
CREATE USER 'username'@'hostname' IDENTIFIED BY 'password';
CREATE USER 'username'@'%' IDENTIFIED BY 'password';

GRANT ALL PRIVILEGES ON `drupal`.* TO 'username'@'127.0.0.1';
FLUSH PRIVILEGES;


CREATE DATABASE IF NOT EXISTS `drupal`;

USE `drupal`;