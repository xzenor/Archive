# Change process priority

```cmd
wmic process where name="AppName" CALL setpriority ProcessIDLevel
```

## Examples

```
wmic process where name="calc.exe" CALL setpriority 32768
```

or

```
wmic process where name="calc.exe" CALL setpriority "above normal"
```

## Priorities:

* idle: 64 (or "idle")
* below normal: 16384 (or "below normal")
* normal: 32 (or "normal")
* above normal: 32768 (or "above normal")
* high priority: 128 (or "high priority")
* real time: 256 (or "realtime")

[Source](https://superuser.com/questions/620724/changing-windows-process-priority-via-command-line#620725)