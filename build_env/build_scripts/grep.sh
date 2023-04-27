. $DIST_ROOT/build_env/build_scripts/start.sh $1

./configure --prefix=/usr   \
            --host=$LFS_TGT

make
make DESTDIR=$LFS install

. $DIST_ROOT/build_env/build_scripts/end.sh $1