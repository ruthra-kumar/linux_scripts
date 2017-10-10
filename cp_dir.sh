#!/bin/bash
#copies the first 512 bytes of a file
#command: find . -type f -exec ./cp_dir.sh "{}" \;
#will copy the entire directory hierarchy but just the 
#first 512 byte of each file along with the folders

dir=`echo $1 | sed -e 's/^\.\/\(.*\)\/.*/\1/' -e 's/^\.\/\(.*\$\)/\1/'`
file=`echo $1 | sed 's/.*\/\(.*$\)/\1/'`

if [ "$dir" == "$file" ]; then
    dd if="$1" of="/run/media/ruthra/movies/testrun/$file" bs=512 count=1 status=none
else

    mkdir -p "/run/media/ruthra/movies/testrun/$dir"

    dd if="$1" of="/run/media/ruthra/movies/testrun/$dir$file" bs=512 count=1 status=none
fi

