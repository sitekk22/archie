. temp_tools/start.sh $1
./configure --prefix=/usr   \
            --enable-shared \
            --without-ensurepip
make
make install

. temp_tools/end.sh $1
