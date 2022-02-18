# block ip address completely

## Runtime
`firewall-cmd --add-rich-rule="rule family='ipv4' source address='162.247.72.0/22' reject"`

## Permanent (loaded at boot)
`firewall-cmd --permanent --add-rich-rule="rule family='ipv4' source address='162.247.72.0/22' reject"`
