# openssl-csr-with-alternative-names-one

```
openssl req -new -sha256 -nodes -out example.com.csr -newkey rsa:2048 -keyout example.com.key -config <(
cat <<-EOF
[req]
default_bits = 2048
prompt = no
default_md = sha256
req_extensions = req_ext
distinguished_name = dn

[ dn ]
C=NL
ST=Zuid-Holland
L=Rotterdam
O=Example Company
OU=IT
emailAddress=admin@example.com
CN = www.example.com

[ req_ext ]
subjectAltName = @alt_names

[ alt_names ]
DNS.1 = example.com
DNS.2 = www.example.com
EOF
)
```
[source](https://www.endpoint.com/blog/2014/10/30/openssl-csr-with-alternative-names-one)