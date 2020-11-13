# Convert DER/PEM

* Convert a DER file (.crt .cer .der) to PEM  
`openssl x509 -inform der -in certificate.cer -out certificate.pem`

* Convert a PEM file to DER  
`openssl x509 -outform der -in certificate.pem -out certificate.der`  
