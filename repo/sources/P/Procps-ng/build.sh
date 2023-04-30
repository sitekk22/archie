./configure --prefix=/usr                           \
                --docdir=/usr/share/doc/procps-ng-4.0.2 \
                            --disable-static                        \
                                        --disable-kill
make
make check

make install
