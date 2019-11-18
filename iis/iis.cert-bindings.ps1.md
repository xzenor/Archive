# List certificates and the iis bindings they are linked to

## Run in administrative powershell shell

```powershell
import-module WebAdministration

Function ListCertBindings
{
	Get-ChildItem cert:\LocalMachine\my | Select-Object * | Sort-Object -Property FriendlyName | ForEach-Object  {
		$found = $false
		$tp = $_.Thumbprint
		Write-Host "***************************************************************"
		Get-ChildItem IIS:\SslBindings | ForEach-Object {
			if ($_.Thumbprint -eq $tp)
			{
			Write-Host "Used in $($_.IpAddress) $($_.Host)" #-foregroundcolor green
			$found = $true
			} 
		}
		if ($found)
		{
			Write-Host "FriendlyName =" $_.FriendlyName -foregroundcolor yellow
			Write-Host $tp -foregroundcolor green
			Write-Host $_.Subject -foregroundcolor green
			Write-Host $_.NotAfter -foregroundcolor green
		}
		else
		{
			Write-Host "FriendlyName =" $_.FriendlyName -foregroundcolor yellow
			Write-Host "Not in use"
			Write-Host $tp -foregroundcolor red
			Write-Host $_.Subject -foregroundcolor red
			Write-Host $_.NotAfter -foregroundcolor red
		}
		Write-Host "***************************************************************"
		Write-Host
	}
}

ListCertBindings
```