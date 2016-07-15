#!/bin/sh
# Author : Harshit Gupta, mercury200Hg@gmail.com
# To convert images set to a particular quality in %.

# Usage : ./compressImages.sh /home/myImageFolder 25

inpath=$1
qlty=$2

for i in $inpath/*;
do
   i=$(basename $i);
   mkdir $inpath$i/pngs
   for j in $inpath$i/*;
   do
       j=$(basename $j);
    echo $inpath$i/$j;
    
    SUBSTRING=$(echo $j| cut -d'.' -f 1 )
    echo $inpath$i/$SUBSTRING.png;
    convert $inpath$i/$j -quality $qlty $inpath$i/$SUBSTRING.png;
    mv $inpath$i/*.png $inpath$i/pngs/
   done
done
