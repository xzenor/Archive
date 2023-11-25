Got the disk information
```
# gpart show
=>       40  234441568  ada0  GPT  (112G)
         40       1024     1  freebsd-boot  (512K)
       1064        984        - free -  (492K)
       2048    4194304     2  freebsd-swap  (2.0G)
    4196352  230244352     3  freebsd-zfs  (110G)
  234440704        904        - free -  (452K)
```
From there i now know the disk is ada0 and the partiton number is 1.

`gpart bootcode -b pmbr -p /boot/gptzfsboot -i 1 ada0 `
