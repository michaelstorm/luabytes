#!/bin/bash
source_dirs="demo lib misc"
source_globs="*.cpp *.h"
header_path="misc/header"

lines=`wc -l $header_path | awk '{print $1;}'`
header=`cat $header_path`
missing=0

for glob in $source_globs; do
    for f in `find $source_dirs -name $glob`; do
        file_header=`head -$lines $f`
        if [ "$header" != "$file_header" ]; then
            echo "HEADER MISSING (add from $header_path): $f"
            missing=1
        fi
    done
done

if [ "$missing" -eq 1 ]; then
    exit 1
else
    exit 0
fi
