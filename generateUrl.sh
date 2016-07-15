#!/bin/sh
# Author : Harshit Gupta, mercury200Hg@gmail.com
# To generate Urls for a particular files in directory

# Usage ./generateUrl.sh ~/inputFolder ~/outputFolder www.example.com /images/

inpath=$1
outpath=$2
domain=$3
baseurl=$4

for i in "$inpath"/*;
do
    i=$(basename $i);
    for j in "$inpath/$i"/*;
    do
        j=$(basename $j);
        echo $domain$baseurl$i"/"$j >> $outpath;
    done
done

