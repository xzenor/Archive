# list CRL content  

For PEM type crl:  
`openssl crl -inform DER -text -noout -in filename.crl`

For DER type crl:  
`openssl crl -inform DER -text -noout -in filename.crl`
