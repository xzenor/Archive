# freebsd: Install /usr/src post Install

Download FreeBSD source code according architecture, version:  
``fetch ftp://ftp.freebsd.org/pub/`uname -s`/releases/`uname -m`/`uname -r | cut -d'-' -f1,2`/src.txz``

Uncompress the source package:  
``tar -C / -xvzf src.txz``

[source](https://nanxiao.gitbooks.io/freebsd-101-hacks/content/posts/install-source-code.html)