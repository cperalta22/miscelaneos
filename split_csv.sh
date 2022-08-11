# takes a csv file with a '#' the BEGINNING the title of each instance 
# and returns multiple files renamed by the title 


#!/usr/bin/bash

csplit $1 /#/ '{*}'
rm xx00
ls xx* > fls
cat $1 | grep '#' | sed 's/#//' | sed 's/,,/.csv/' > nms
paste -d'\n' {fls,nms} | xargs -d'\n' -n2 mv --
rm fls nms
