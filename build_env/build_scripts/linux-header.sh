. $DIST_ROOT/build_env/build_scripts/start.sh $1

make mrproper
make headers
find usr/include -type f ! -name '*.h' -delete
cp -rv usr/include $LFS/usr

cd $LFS/sources
. $DIST_ROOT/build_env/build_scripts/end.sh $1