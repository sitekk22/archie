. $DIST_ROOT/build_env/build_scripts/start.sh $1
ln -sfv ../lib/ld-linux-x86-64.so.2 $LFS/lib64
ln -sfv ../lib/ld-linux-x86-64.so.2 $LFS/lib64/ld-lsb-x86-64.so.3
patch -Np1 -i ../glibc-2.37-fhs-1.patch
cd glibc-2.37-fhs-1

mkdir -v build
cd       build

echo "rootsbindir=/usr/sbin" > configparms


../configure                             \
      --prefix=/usr                      \
      --host=$LFS_TGT                    \
      --build=$(../scripts/config.guess) \
      --enable-kernel=3.2                \
      --with-headers=$LFS/usr/include    \
      libc_cv_slibdir=/usr/lib

make
make DESTDIR=$LFS install
sed '/RTLDLIST=/s@/usr@@g' -i $LFS/usr/bin/ldd

echo 'int main(){}' | $LFS_TGT-gcc -xc -
readelf -l a.out | grep ld-linux
rm -v a.out

$LFS/tools/libexec/gcc/$LFS_TGT/12.2.0/install-tools/mkheaders

. $DIST_ROOT/build_env/build_scripts/end.sh $1