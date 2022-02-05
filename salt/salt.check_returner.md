# Check returner

```
salt-call -l debug test.ping --return smtp 2>&1 |egrep -i '(return|smtp)'
```