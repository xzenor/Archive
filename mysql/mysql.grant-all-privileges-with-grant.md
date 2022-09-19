# GRANT ALL PRIVILEGES but with GRANT  

By default ALL PRIVILEGES isn't truly **ALL** PRIVILEGES. It's missing the GRANT privilege. To give ALL PRIVILEGES including GRANT use it like this:

```
GRANT ALL PRIVILEGES ON mydb.* TO 'myuser'@'%' WITH GRANT OPTION;
```

[Source](https://stackoverflow.com/questions/5016505/mysql-grant-all-privileges-on-database)