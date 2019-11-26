# Verify key against certificate

List the modulus of the certificate  
`openssl x509 -noout -modulus -in server.crt`

List the modulus of the private key  
`openssl rsa -noout -modulus -in server.key`

They should match.

[source](https://kb.wisc.edu/middleware/4064)
