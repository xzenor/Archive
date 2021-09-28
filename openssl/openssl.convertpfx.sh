#!/bin/bash

if [ -n "$1" ]; then
  echo -n PFX Password:
  read -s pfxpass
  filename=${1%.*}

  openssl pkcs12 -in $1 -nocerts -out $filename-encrypted.key -passin pass:$pfxpass -passout pass:$pfxpass
  openssl pkcs12 -in $1 -clcerts -nokeys -out $filename.crt -passin pass:$pfxpass
  openssl rsa -in $filename-encrypted.key -out $filename.key -passin pass:$pfxpass

else
  echo "usage: convertpfx ./abcdefg.pfx"
fi
