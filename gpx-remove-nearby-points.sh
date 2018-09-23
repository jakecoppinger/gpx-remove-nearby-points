#!/usr/bin/env bash
set -e


#echo "lat: $1"
#echo "lon: $2"
#echo "dec places: $3"

if [ "$#" -ne 3 ]; then
    echo "Jake Coppinger <jake@jakecoppinger.com> 2018"
    echo "./gpc-remove-nearby-points.sh LATITUDE LONGITUDE DEC_PLACES"
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

lat=$(python3 -c "integer,decimal='$1'.split('.');print(f'{integer}\.{decimal[0:min(len(decimal),$3)]}')")
lat=$(python3 -c "integer,decimal='$2'.split('.');print(f'{integer}\.{decimal[0:min(len(decimal),$3)]}')")


cat /dev/stdin| python -c "import sys; print(' '.join([ l.strip() for l in sys.stdin.readlines() ]))" | perl -pe "s/<trkpt lat=\"$lat[0-9]*\" lon=\"$lon[0-9]*\">.*?<\/trkpt>//g"
