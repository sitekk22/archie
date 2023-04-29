. $DIST_ROOT/build_env/build_scripts/start.sh $1

./configure --prefix=/usr \
            --docdir=/usr/share/doc/bison-3.8.2
make
make install


. $DIST_ROOT/build_env/build_scripts/end.sh $1


