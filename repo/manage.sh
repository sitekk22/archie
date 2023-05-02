path="/sources/repo"
list="$path/package_list"
links="$path/links"
log_file=$path/log
touch $log_file
export MAKEFLAGS='-j 12'
for p in $(cat $list)
do

    repo=$(grep -i $p $links)
    #echo $repo #link
    bn=$(echo $p | awk -F'-' '{$NF="\b"}1' | tr " " "-" | rev | cut -c 3- | rev)
    echo $bn

    #echo $p #name
    ver=$(echo $p | cut -d "-" -f 2-)
    repo_dir="$path/sources/${p:0:1}/$bn"
    cd $repo_dir/$bn
    #wget -O $repo_dir/$p.tar.xz  $repo
    #mkdir $bn && tar -xf $p -C $bn --strip-components 1
    if test -f ../$bn.log; then
        rm ../$bn.log
    fi
    touch ../$bn.log

    .././build.sh | tee ../$bn.log
    echo "$? $bn" >> $log_file
    echo "---------------------------------------"
    echo "$p DONE"
    echo "---------------------------------------"
    sleep 2
done
#grep -i $links -f $list > needed
