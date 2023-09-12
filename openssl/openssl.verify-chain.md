# Verify SSL certificate chain  

## Alleen intermediate
```
openssl verify -verbose -CAfile intermediate.pem  certificate.crt
```

## Met CA er bij. (let op de volgorde)
```
openssl verify -verbose -CAfile CA.pem -CAfile intermediate.pem  certificate.crt
```
