. $DIST_ROOT/build_env/build_scripts/start.sh $1
./configure --prefix=/usr   \
            --enable-shared \
            --without-ensurepip
make
make install

. $DIST_ROOT/build_env/build_scripts/end.sh $1
