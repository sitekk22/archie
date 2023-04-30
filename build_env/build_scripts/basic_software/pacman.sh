./start.sh pacman-6.0.2.tar.xz

./ninja.sh
./meson.sh
sleep 2
meson build
ninja -C build
ninja -C build install


./end.sh pacman-6.0.2.tar.xz
