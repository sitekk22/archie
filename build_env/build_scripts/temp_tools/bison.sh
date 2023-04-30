. temp_tools/start.sh $1

./configure --prefix=/usr \
            --docdir=/usr/share/doc/bison-3.8.2
make
make install


. temp_tools/end.sh $1


