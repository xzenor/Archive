# block ip address completely

## Runtime
`firewall-cmd --add-rich-rule="rule family='ipv4' source address='123.123.123.0/22' reject"`

## Permanent (loaded at boot)
`firewall-cmd --permanent --add-rich-rule="rule family='ipv4' source address='123.123.123.0/22' reject"`

## Remove rule at runtime (will be back after a reboot)
`firewall-cmd --remove-rich-rule='rule family="ipv4" source address="123.123.123.0/22" reject'`

## Remove rule completely
`firewall-cmd --permanent --remove-rich-rule='rule family="ipv4" source address="123.123.123.0/22" reject'`

