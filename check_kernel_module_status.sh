#!/bin/bash

#Reading all the module currently used by kernel and extractig
#their names to a file.
lsmod | sed 's/\(^.*\)\ \{4,\}.*/\1/g' > lsmod.txt

filename='lsmod.txt'

while read line ;do
    echo $line
    systool -v -m $line | grep 'initstate'
done < $filename

#Remove the temporary file created
rm -v lsmod.txt
