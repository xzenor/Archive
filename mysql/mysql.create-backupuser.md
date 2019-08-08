# mysql: create a backup user

* Launch the mysql command-line client.
* Create the backup user. For this recipe, we'll call the user backupuser and give the user the password p455w0rd. The user can be named anything we wish, and the password should definitely be changed to something unique:
* CREATE USER 'backupuser'@'localhost' IDENTIFIED BY 'p455w0rd';
* Next, we will grant our new user a minimal set of permissions, just enough so that it can make backups as follows:
* GRANT SELECT, SHOW VIEW, LOCK TABLES, RELOAD, REPLICATION CLIENT ON *.* TO 'backupuser'@'localhost';
* Lastly, we will use the FLUSH PRIVILEGES command to force MariaDB to reread the privileges table, which is always a good idea after granting new privileges to a user.
FLUSH PRIVILEGES;

[Source](https://subscription.packtpub.com/book/big_data_and_business_intelligence/9781783284399/1/ch01lvl1sec14/creating-a-backup-user)