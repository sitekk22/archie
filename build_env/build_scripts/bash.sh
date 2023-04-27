. $DIST_ROOT/build_env/build_scripts/start.sh $1

./configure --prefix=/usr                      \
            --build=$(sh support/config.guess) \
            --host=$LFS_TGT                    \
            --without-bash-malloc

make
make DESTDIR=$LFS install
ln -sv bash $LFS/bin/sh

. $DIST_ROOT/build_env/build_scripts/end.sh $1