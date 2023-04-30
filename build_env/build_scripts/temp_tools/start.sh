FILE=$1

echo "--------------------------------"
echo "$FILE"
echo "--------------------------------"
sleep 1

cd "$LFS/sources"
tar -xf $FILE
bname=$(basename -s ".tar" ${FILE%.*})
echo $bname
DIR=$(find $LFS/sources -maxdepth 1 -type d -iname "$bname")
echo $DIR
cd $DIR

