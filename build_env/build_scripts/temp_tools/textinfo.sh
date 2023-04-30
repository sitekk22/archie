. temp_tools/start.sh $1
./configure --prefix=/usr
make
make install

. temp_tools/end.sh $1
