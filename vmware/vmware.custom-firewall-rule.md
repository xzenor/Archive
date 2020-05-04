1. Log in to the ESXi host with root credentials using an SSH client.
Navigate to /etc/vmware/firewall using the command:  
`cd /etc/vmware/firewall/`

2. Create a new file with the name extension .xml:  
Note: This example uses the vi editor.  
`# vi test.xml`

```xml
<ConfigRoot>
<service>
<id>ServiceName</id>
<rule id='0000'>
<direction>inbound</direction>
<protocol>tcp</protocol>
<porttype>dst</porttype>
<port>1234</port>
</rule>
<rule id='0001'>
<direction>outbound</direction>
<protocol>tcp</protocol>
<porttype>dst</porttype>
<port>1234</port>
</rule>
<rule id='0002'>
<direction>inbound</direction>
<protocol>udp</protocol>
<porttype>dst</porttype>
<port>1234</port>
</rule>
<rule id='0003'>
<direction>outbound</direction>
<protocol>udp</protocol>
<porttype>dst</porttype>
<port>1234</port>
</rule>
<enabled>false</enabled>
<required>false</required>
</service>
</ConfigRoot>
```
Where:

**id** is the rule name as it will show up in the interface.
**enabled** is the default status when the service is first loaded.  
**required** indicates whether the service is required and cannot be disabled.  
**rule id** indicates the rules required and starts with 0000, 0001, 0002, and so on.  
**protocol** indicates if it is TCP/UDP protocol (If you need same port number for TCP and UDP, you must have two rules.)  
**direction** specifies if incoming or outgoing port. (You must have a separate rule for incoming and outgoing communication.)  
**porttype** is set to dst for destination.
**port** is the required port number. (You can have multiple rules for different ports in same file.)

4. Load configurations with the command:  
`# esxcli network firewall refresh`  
After this command the service should be available in the interface in *Security Profile > Firewall*  
You can enable or disable it there.  
If you can not find the firewall rule in the list, try unloading and loading the firewall rule with the commands:

`# esxcli network firewall unload`  
`# esxcli network firewall load`