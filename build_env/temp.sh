path="/lfs/archie/build_env/build_scripts/*"
sources="/lfs/archie/build_env/build_root/sources"
create="/lfs/archie/build_env/create.sh"
for f in $path
do
    echo $f
    file=$(find $sources -iname "$(basename -s ".sh" $f)*" 2>/dev/null)
    echo $file
    echo "bash -e build_env/build_scripts/$(basename $f) $(basename $file)" >> $create

done
