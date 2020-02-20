# openssl: List Subject Alternate Names

If you need to list the Subject Alternate Names of an https website certificate remotely:  
`openssl s_client -connect www.example.com:443 -showcerts </dev/null | openssl x509 -inform pem -noout -text`

Search the output for **X509v3 Subject Alternative Name:** followed by one or more **DNS:** entries.
