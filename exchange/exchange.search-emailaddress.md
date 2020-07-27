# Search what account and email address is bound to

## Search for accounts with an info@ email address

```powershell
Get-Recipient -resultSize unlimited | select name -expand emailAddresses | where {$_.smtpAddress -match ".*info@.*"} | Format-Table name, smtpaddress
```