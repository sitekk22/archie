. $DIST_ROOT/build_env/build_scripts/start.sh $1

make
make DESTDIR=$LFS install
. $DIST_ROOT/build_env/build_scripts/end.sh $1