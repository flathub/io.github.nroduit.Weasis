#!/bin/bash

while read i
do
type="- type: file"
url=$i
filename=${url##*/}
fullpath=`find .flatpak-builder/build/weasis/.m2/repository/ -type f -name $filename`
fullpath2=${fullpath##.flatpak-builder/build/weasis/.m2/repository/}
dest=".m2/repository/${fullpath2/$filename}"
sha256=`sha256sum $fullpath | cut -c 1-64`
echo -e "- type: file\n  dest: $dest\n  url: $url\n  sha256: $sha256"
done < <(cat $1 | natsort -p) | tee maven-dependencies.yaml
