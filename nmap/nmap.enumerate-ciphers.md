# Enumerate ssl ciphers with nmap

Download ssl-enum-ciphers.nse from nmap website.   
[Here](https://svn.nmap.org/nmap/scripts/ssl-enum-ciphers.nse)

Execute like this:   
`nmap -sV --script ssl-enum-ciphers -p 443 <host>`

[source](https://nmap.org/nsedoc/scripts/ssl-enum-ciphers.html)