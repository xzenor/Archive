# Working with intermediate certificates in easyrsa

1. Setup two separate Easy-RSA installations.
2. Initialise and build a CA as normal on the first one (lets call it RootCA).
3. Initialise the second one, but build CA with the subca option (lets call it IntCA).
4. When a a subca is built, no certificate is generated, only a request is generated. Import this request (IntCA/pki/reqs/ca.req) into RootCA.
5. Sign the IntCA request imported into RootCA, as the root CA. This will generate the certificate (RootCA/pki/issued/IntCA.crt).
6. Copy the IntCA.cert file to the IntCA setup at IntCA/pki/ca.crt.
7. Now you can use IntCA for all your mainstream activities and lock away the RootCA until the IntCA needs to be managed (renewed, revoked, etc.). Just ensure that you are always within the IntCA directory when issuing ./easyrsa commands. Better still use full paths to avoid using the root CA by mistake.

[source](https://github.com/OpenVPN/easy-rsa/issues/190)
