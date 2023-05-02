touch /root/.bashrc
cat > /root/.bashrc << "EOF"
export MAKEFLAGS="-j12"
EOF
source /root/.bashrc
touch /var/log/{btmp,lastlog,faillog,wtmp}
chgrp -v utmp /var/log/lastlog
chmod -v 664  /var/log/lastlog
chmod -v 600  /var/log/btmp
