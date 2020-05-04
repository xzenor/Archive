# Kill all connections to a specific database

```sql
USE [master];

DECLARE @kill varchar(8000) = '';  
SELECT @kill = @kill + 'kill ' + CONVERT(varchar(5), session_id) + ';'  
FROM sys.dm_exec_sessions
WHERE database_id  = db_id('MyDatabase')

EXEC(@kill);
```

[source](https://stackoverflow.com/questions/7197574/script-to-kill-all-connections-to-a-database-more-than-restricted-user-rollback)