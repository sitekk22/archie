. temp_tools/start.sh $1
./configure --disable-shared
make
cp -v gettext-tools/src/{msgfmt,msgmerge,xgettext} /usr/bin
. temp_tools/end.sh $1

