# openssl: convert pfx to cert/key

1. export encrypted key  
   `openssl pkcs12 -in [certificate.pfx] -nocerts -out [privateKey-encrypted.key]`

2. export certificate  
   `openssl pkcs12 -in [certificate.pfx] -clcerts -nokeys -out [certificate.crt]`

3. remove encryption from key  
   `openssl rsa -in [keyfile-encrypted.key] -out [privateKey.key]`

* convert pfx to encrypted pem  
`openssl pkcs12 -in [yourfile.pfx] -out [keyStore.pem] -nodes`

* convert pem to pfx  
`openssl pkcs12 -export -out [certificate.pfx] -inkey [privateKey.key] -in [certificate.crt] -certfile [CACert.crt]`

[source1](https://www.markbrilman.nl/2011/08/howto-convert-a-pfx-to-a-seperate-key-crt-file/)  
[source2](https://www.sslshopper.com/article-most-common-openssl-commands.html)  
