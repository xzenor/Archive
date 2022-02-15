# Force smartcard login (Regedit)

## Enable

```regedit
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System]
"scforceoption"=dword:00000001
```

## Disable

```regedit
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System]
"scforceoption"=dword:00000000
```
