./configure ADJTIME_PATH=/var/lib/hwclock/adjtime \
                --bindir=/usr/bin    \
                            --libdir=/usr/lib    \
                                        --sbindir=/usr/sbin  \
                                                    --disable-chfn-chsh  \
                                                                --disable-login      \
                                                                            --disable-nologin    \
                                                                                        --disable-su         \
                                                                                                    --disable-setpriv    \
                                                                                                                --disable-runuser    \
                                                                                                                            --disable-pylibmount \
                                                                                                                                        --disable-static     \
                                                                                                                                                    --without-python     \
                                                                                                                                                                --without-systemd    \
                                                                                                                                                                            --without-systemdsystemunitdir \
                                                                                                                                                                                        --docdir=/usr/share/doc/util-linux-2.38.1

make

chown -Rv tester .
su tester -c "make -k check"

make install
