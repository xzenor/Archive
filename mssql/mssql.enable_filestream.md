# Enable filestream in MSSQL

```sql
EXEC sp_configure filestream_access_level, 2  
RECONFIGURE  
```

[source](https://docs.microsoft.com/en-us/sql/relational-databases/blob/enable-and-configure-filestream?view=sql-server-ver15)
