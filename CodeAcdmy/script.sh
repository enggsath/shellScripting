#!/bin/bash

echo "Hey,Sath welcom to Script of copying source files to build dir"
version_file='./source/changelog.md'
dir='./source/*'
#read the first line of changelog file
readline=$(head -n 1 $version_file)
read -a splitline <<< $readline   #split the line into array
current_version=${splitline[1]}  #access 2nd elemt in the array

echo $current_version #display current version of file

read -p "Enter 1(continue) / 0(exit)" versionContinue #prompt user to cont or exit

if [ $versionContinue -eq 0 ]
then
    echo "Comeback after updating"
else
    for file in $dir
    do
        if [ $file == './source/secretinfo.md' ]
        then
            echo "$file is not being copied"
        else
            echo "$file is being copied"
            cp $file ./build
        fi
    done
    echo "Build files of version:$current_version are"
    ls ./build
fi
