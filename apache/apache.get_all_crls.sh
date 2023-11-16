#!/usr/bin/bash
CRLPATH="/etc/pki/tls/crl"

CRLLIST=$(
for ConfigFile in `find /etc/httpd -name '*.conf'`
do
    for CertFile in `grep -h CertificateFile $ConfigFile|grep -v "^#"|awk '{print $2}'`
    do
        openssl crl2pkcs7 -nocrl -certfile $CertFile | openssl pkcs7 -print_certs -text -noout |grep -e '.crl$'|cut -d ':' -f 2,3
    done
done|sort|uniq
)


for CRL in $CRLLIST
do
    CRLFILE=$(echo $CRL|sed 's/^http\:\/\///'|sed 's/\//_/g')
    curl -s $CRL  | openssl crl -inform DER -out $CRLPATH/$CRLFILE
    if test -f $CRLPATH/$CRLFILE; then
        ln -f -s $CRLPATH/$CRLFILE $CRLPATH/`openssl crl -hash -noout -in $CRLPATH/$CRLFILE`.r0
    fi
done
