# Backup logs to NUL  

```sql
--take NUL: LOG backup of AdventureWorks2012 <---THIS WILL BREAK LOG CHAIN
BACKUP LOG AdventureWorks2012 TO DISK = 'NUL:'
--WITH COPY_ONLY
```
