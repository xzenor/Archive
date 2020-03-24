# Generate CSR

## Basic

`openssl req -out CSR.csr -new -newkey rsa:2048 -nodes -keyout privateKey.key`

## Extended

`openssl req -nodes -newkey rsa:2048 -keyout private.key -out CSR.csr -subj "/serialNumber=<OIN>/C=<Landcode>/ST=<Provincie>/L=<Plaats>/O=<Organisatie>/CN=<Domeinnaam>"`
