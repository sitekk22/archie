. $DIST_ROOT/build_env/build_scripts/start.sh $1

mkdir -v build
cd       build

../configure --prefix=$LFS/tools \
             --with-sysroot=$LFS \
             --target=$LFS_TGT   \
             --disable-nls       \
             --enable-gprofng=no \
             --disable-werror

make
make install

. $DIST_ROOT/build_env/build_scripts/end.sh $1