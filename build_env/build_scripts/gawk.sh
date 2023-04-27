. $DIST_ROOT/build_env/build_scripts/start.sh $1

sed -i 's/extras//' Makefile.in
./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess)
make
make DESTDIR=$LFS install
. $DIST_ROOT/build_env/build_scripts/end.sh $1