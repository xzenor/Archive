# From <https://social.technet.microsoft.com/Forums/en-US/5f1a2cee-19ad-43e6-b281-bb7f094d8c09/pop-works-via-localhost-but-not-from-other-networked-machines?forum=exchangesvrclients> 

Problem:
  POP works via localhost but not from other networked machines

Get-ServerComponentstate -Identity CHIEXC02
  Found that the PopProxy Component was inactive, looking in Event logs, found it was bumped to inactive by HealthAPI.

Set-ServerComponentState -Identity CHIEXC02 -Component PopProxy -Requester HealthAPI -State Active
  Kicked the component active again, and now POP3 responds from the external IPs.