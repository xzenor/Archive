```xml
# Forbid access to xmlrpc.php globally at server level
<Files "xmlrpc.php">
  Require all denied
</Files>

# Add exception for a site that needs XML-RPC
<Directory "/web/site-1/public">
  <Files "xmlrpc.php">
    Require all granted
  </Files>
</Directory>

# Add exception for a second site that needs XML-RPC
<Directory "/web/site-2/public">
  <Files "xmlrpc.php">
    Require all granted
  </Files>
</Directory>
```

[source](https://recipes.op111.net/2020/06/01/block-xmlrpc-php-globally-with-exceptions/)