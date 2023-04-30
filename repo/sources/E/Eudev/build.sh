sed -i '/udevdir/a udev_dir=${udevdir}' src/udev/udev.pc.in


./configure --prefix=/usr           \
            --bindir=/usr/sbin      \
            --sysconfdir=/etc       \
            --enable-manpages       \
            --disable-static

make
mkdir -pv /usr/lib/udev/rules.d
mkdir -pv /etc/udev/rules.d
make check
make install
tar -xvf ../udev-lfs-20171102.tar.xz
make -f udev-lfs-20171102/Makefile.lfs install

udevadm hwdb --update