#!/usr/bin/env bash


lat=`./coordTrimmer.py $2 $4`
lon=`./coordTrimmer.py $3 $4`

#echo "Lat is $lat"
#echo "Lon is $lon"
cat $1 | perl -pe "s/<trkpt lat=\"$lat[0-9]*\" lon=\"$lon[0-9]*\">.*?<\/trkpt>//g"

