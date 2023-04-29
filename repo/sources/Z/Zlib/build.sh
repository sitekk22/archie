./configure --prefix=/usr

make
make check
make installrm -fv /usr/lib/libz.a