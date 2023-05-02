path="/lfs/archie/build_env/build_root/sources/repo"
list="/lfs/archie/repo/package_list"
links="/lfs/archie/repo/links"
patches="/lfs/archie/repo/patches"
: << "COMM"
for p in $(cat $list)
do

    repo=$(grep -i $p $links)
    #echo $repo #link
    bn=$(echo $p | awk -F'-' '{$NF="\b"}1' | tr " " "-" | rev | cut -c 3- | rev)
    echo $bn

    #echo $p #name
    ver=$(echo $p | cut -d "-" -f 2-)
    repo_dir="$path/sources/${p:0:1}/$bn"
    mkdir -p $repo_dir
    cd $repo_dir
    if ! test -f $repo_dir/$p.tar
    then
        wget -O $repo_dir/$p.tar  $repo
        mkdir -p $bn && tar -xf $p.tar -C $bn --strip-components 1
    fi
    #cd $bn
    #../build.sh

done
COMM
for p in $(cat $patches)
do

    name=$(echo $p | rev | cut -d "/" -f 1 | rev)
    name=${name^}
    bn=$(echo $name | cut -d "-" -f 1)
    echo $bn
    pth=$(find $path -maxdepth 3 -iname "$bn")
    wget -P $pth $p
done
#grep -i $links -f $list > needed
