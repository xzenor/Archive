# Verify SSL certificate chain  

```
openssl verify -verbose -CAfile intermediate.pem  certificate.crt
