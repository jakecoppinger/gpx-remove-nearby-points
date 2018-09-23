#!/usr/bin/env bash

if [ "$#" -ne 4 ]; then
    echo "Jake Coppinger <jake@jakecoppinger.com> 2018"
    echo "./gpc-remove-nearby-points.sh FILENAME LATITUDE LONGITUDE DEC_PLACES"
    echo ""
    echo "Removes all GPX (GPS) track points that match the given coordinate"
    echo "to DEC_PLACES places."
    echo ""
    echo "eg. a trackpoint -33.88260 151.20653 would be removed if "
    echo "-33.88212 151.20699 is passed to the program and DEC_PLACES"
    echo "is 3 (the first 3 decimals places match)"
    echo ""
    echo "1st dec place: worth up to 11.1km"
    echo "2st: 1.1km"
    echo "3rd: 110m"
    echo "4th: 11m"
    echo "5th: 1.1m"
    echo "6th: 0.11m"
    echo "7th: 11mm"
    echo "8th: 1.1mm"
    echo "(from https://gis.stackexchange.com/questions/8650/measuring-accuracy-of-latitude-and-longitude/8674#8674)"
    exit
fi

lat=`./coordTrimmer.py $2 $4`
lon=`./coordTrimmer.py $3 $4`

#echo "lat in gpx remove is $lat"
#echo "lon in gpx remove is $lon"

cat $1 | python -c "import sys; print(' '.join([ l.strip() for l in sys.stdin.readlines() ]))" | perl -pe "s/<trkpt lat=\"$lat[0-9]*\" lon=\"[0-9\.]*\">.*?<\/trkpt>//g"| perl -pe "s/<trkpt lat=\"[0-9\.]*\" lon=\"$lon[0-9]*\">.*?<\/trkpt>//g"
