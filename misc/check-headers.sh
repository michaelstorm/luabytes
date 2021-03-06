#!/bin/bash

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
# 
# You should have received a copy of the GNU Lesser General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

source_dirs="demo lib misc"
source_exts="cpp h sh"
header_path="misc/header"

missing=0

for ext in $source_exts; do
    lines=`wc -l ${header_path}.${ext} | awk '{print $1;}'`
    header=`cat ${header_path}.${ext}`
    for f in `find $source_dirs -name *.$ext`; do
        file_header=`head -$lines $f`
        if [ "$header" != "$file_header" ]; then
            echo "HEADER MISSING (add from $header_path.$ext): $f"
            missing=1
        fi
    done
done

if [ "$missing" -eq 1 ]; then
    exit 1
else
    exit 0
fi
