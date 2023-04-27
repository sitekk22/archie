FILE=$1

cd $LFS/sources
bname=$(basename -s ".tar" ${FILE%.*})
DIR=$(find $LFS/sources -maxdepth 1 -type d -iname "$bname")
echo $DIR
rm -rf $DIR

echo "CLEAING DONE $FILE"
sleep 2
