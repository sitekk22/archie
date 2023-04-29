path="/lfs/archie/build_env/build_scripts/temp_tools/*"
sources="/lfs/archie/build_env/build_root/sources"
create="/lfs/archie/build_env/build_temp.sh"
for f in $path
do
    echo $f
    file=$(find $sources -iname "$(basename -s ".sh" $f)*" 2>/dev/null)
    echo $file
    echo "bash -e build_env/build_scripts/$(basename $f) $(basename $file)" >> $create

done
