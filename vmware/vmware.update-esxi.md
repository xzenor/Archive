# Open outgoing http port
`esxcli network firewall ruleset set -e true -r httpClient`

# Fetch all updates
`esxcli software sources profile list -d https://hostupdate.vmware.com/software/VUM/PRODUCTION/main/vmw-depot-index.xml | grep ESXi-6.5.0`

# Install specific updates
`esxcli software profile update -d https://hostupdate.vmware.com/software/VUM/PRODUCTION/main/vmw-depot-index.xml -p ESXi-6.5.0-20170702001-standard`
