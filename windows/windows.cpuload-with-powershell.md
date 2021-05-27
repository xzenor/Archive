# Get windows cpu load with powershell

```ps
Get-Counter '\Process(*)\% Processor Time' | Select-Object -ExpandProperty countersamples| Select-Object -Property instancename, cookedvalue| ? {$_.instanceName -notmatch "^(idle|_total|system)$"} | Sort-Object -Property cookedvalue -Descending| Select-Object -First 25| ft InstanceName,@{L='CPU';E={($_.Cookedvalue/100/$env:NUMBER_OF_PROCESSORS).toString('P')}} -AutoSize
```

[source](https://superuser.com/questions/176624/linux-top-command-for-windows-powershell/1238893#1238893)
