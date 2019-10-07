# openssl: Inspect remote smtp tls certificate

If you have to check the certificate with STARTTLS, then just do
`openssl s_client -connect mail.example.com:25 -starttls smtp`

or for a standard secure smtp port:
`openssl s_client -connect mail.example.com:465`

or an https website:
`openssl s_client -connect www.example.com:443 -showcerts`

[source](http://serverfault.com/questions/131627/how-to-inspect-remote-smtp-servers-tls-certificate)