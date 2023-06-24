Encryption with a password:

`openssl enc -aes256 -e -pbkdf2 -a -in file -out file.aes256 -pass pass:<password>`

Encryption with a passfile:

`openssl enc -aes256 -e -pbkdf2 -a -in file -out file.aes256 -pass file:<passfile>`

Decryption with a password:

`openssl enc -aes256 -d -pbkdf2 -a -in file.aes256 -out file -pass pass:<password>`

Decryption with a passfile:

`openssl enc -aes256 -d -pbkdf2 -a -in file.aes256 -out file -pass file:<passfile>`

* The "enc" sub-command means encoding with ciphers.
* The "-aes256" option is the cipher we chose, to get a list of available ciphers enter "openssl enc -list"
* The "-e" and "-d" options tell OpenSSL to encrypt or decrypt, respectively.
* The "-pbkdf2" option tells OpenSSL to derive a more secure passphrase.
* "-a" indicates we want to use Base64 encoding [reduces the possibility of corruption, especially when sending the file over a network].
* "-in" The file to encrypt/decrypt.
* "-out" The encrypted/decrypted file name.
* "-pass pass:<passphrase>" or "-pass file:<passfile>" The passphrase or passfile to use. (openssl only reads the first line of <passfile> for a passphrase)

[source](https://www.reddit.com/r/freebsd/comments/t6z64d/openssl/)
