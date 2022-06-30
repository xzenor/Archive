#!/bin/sh

BASENAME=`basename $1 .pfx`

openssl pkcs12 -in $1 -nocerts -out encrypted.key -passin pass:$2 -passout pass:$2
openssl rsa -in encrypted.key -out $BASENAME.key -passin pass:$2
openssl pkcs12 -in $1 -clcerts -nokeys -out $BASENAME.crt  -passin pass:$2
rm encrypted.key
