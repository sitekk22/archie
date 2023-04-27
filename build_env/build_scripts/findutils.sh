
. $DIST_ROOT/build_env/build_scripts/start.sh $1
./configure --prefix=/usr                   \
            --localstatedir=/var/lib/locate \
            --host=$LFS_TGT                 \
            --build=$(build-aux/config.guess)

make
make DESTDIR=$LFS install
. $DIST_ROOT/build_env/build_scripts/end.sh $1