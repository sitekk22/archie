. $DIST_ROOT/build_env/build_scripts/start.sh $1



./configure --prefix=/usr                     \
            --host=$LFS_TGT                   \
            --build=$(build-aux/config.guess) \
            --disable-static                  \
            --docdir=/usr/share/doc/xz-5.4.1

make
make DESTDIR=$LFS install
rm -v $LFS/usr/lib/liblzma.la
. $DIST_ROOT/build_env/build_scripts/end.sh $1