# ipsec VPN commands

* Check tunnels

```junos
show security ike security-associations
show security ipsec security-associations
show security ipsec inactive-tunnels
```

* Reset tunnels

```junos
clear security ike security-associations ip.ad.dre.ss
clear security ipsec security-associations index ipsec-index-ID
```
