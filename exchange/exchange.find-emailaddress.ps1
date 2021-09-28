$emailaddress='user@domain.com'

# Search mailboxes
Get-Mailbox -Identity * |Where-Object {$_.EmailAddresses -like 'SMTP:$emailaddress'} |Format-List Identity, EmailAddresses

# Search distributiongroups
Get-DistributionGroup |Where-Object {$_.EmailAddresses -like 'SMTP:$emailaddress'} |Format-List Identity, EmailAddresses
