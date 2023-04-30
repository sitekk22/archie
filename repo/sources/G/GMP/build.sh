./configure --prefix=/usr    \
                --enable-cxx     \
                            --disable-static \
                                        --docdir=/usr/share/doc/gmp-6.2.1

make
make html
make check 2>&1 | tee gmp-check-log
awk '/# PASS:/{total+={} ; END{print total}' gmp-check-log'}'
echo ("PROCEED INSTALLATION [yn]")
read $ans
if [ $ans == y ]
then
    make install
    make install-html
fi
