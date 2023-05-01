echo "LFS: ${LFS:?}"
echo "DIST_ROOT: ${DIST_ROOT:?}"
chown -R root:root $LFS/{usr,lib,var,etc,bin,sbin,tools,lib64}

mkdir -pv $LFS/{dev,proc,sys,run}
mount -v --bind /dev $LFS/dev
mount -v --bind /dev/pts $LFS/dev/pts
mount -vt proc proc $LFS/proc
mount -vt sysfs sysfs $LFS/sys
mount -vt tmpfs tmpfs $LFS/run
if [ -h $LFS/dev/shm  ]; then
      mkdir -pv $LFS/$(readlink $LFS/dev/shm)
  else
        mount -t tmpfs -o nosuid,nodev tmpfs $LFS/dev/shm
        fi

chroot "$LFS" /usr/bin/env -i   \
                HOME=/root                  \
                    TERM="$TERM"                \
                        PS1='(lfs chroot) \u:\w\$ ' \
                            PATH=/usr/bin:/usr/sbin     \
                                /bin/bash --login
