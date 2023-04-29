. $DIST_ROOT/build_env/build_scripts/start.sh $1
./configure --disable-shared
make
cp -v gettext-tools/src/{msgfmt,msgmerge,xgettext} /usr/bin
. $DIST_ROOT/build_env/build_scripts/end.sh $1

