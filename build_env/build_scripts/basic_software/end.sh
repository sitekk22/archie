FILE=$1


cd $LFS/sources
bname=$(basename -s ".tar" ${FILE%.*})
DIR=$(find $LFS/sources -maxdepth 1 -type d -iname "$bname")
echo $DIR
rm -rf $DIR
echo "$bname DONE $(date +"%H:%M:%S")" >> $DIST_ROOT/log
echo "CLEAING DONE $FILE"
sleep 2
