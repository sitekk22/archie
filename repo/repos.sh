path="/lfs/archie/repo"
list="/lfs/archie/repo/package_list"
links="/lfs/archie/repo/links"

for p in $(cat $list)
do

    repo=$(grep -i $p $links)
    #echo $repo
    bn=$(echo $p | cut -d "-" -f -1)
    ver=$(echo $p | cut -d "-" -f 2-)
    if [  -z $(echo $p | grep Man-DB) ]
    then

        mkdir -p sources/${p:0:1}/$bn 2>/dev/null
        echo $p
        repo_dir="$path/sources/${p:0:1}/$bn"
        cat >> $repo_dir/.pck << EOF
name: $bn
version: $ver
repo: core
source: $repo
deps: [

]
mkdeps: [

]
extras: [

]
EOF
        mkdir $repo_dir/.install
        touch $repo_dir/.build
    #wget $repo -P $path/sources/${p:0:1}/$bn
    fi
done
mkdir -p $path/sources/M/Man-DB/.install
touch $path/sources/M/Man-DB/.build

cat >> $path/sources/M/Man-DB/.pck << EOF
name: Man-DB
version: 2.11.2
repo: core
source: https://download.savannah.gnu.org/releases/man-db/man-db-2.11.2.tar.xz
deps: [

]
mkdeps: [

]
extras: [

]
EOF

#grep -i $links -f $list > needed

