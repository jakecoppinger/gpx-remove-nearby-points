#!/usr/bin/env bash

if [ "$#" -ne 4 ]; then
    echo "Jake Coppinger <jake@jakecoppinger.com> 2018"
    echo "./gpc-remove-nearby-points.sh LATITUDE LONGITUDE DEC_PLACES"
    echo ""
    echo "Removes all track points that match the given coordinate"
    echo "to DEC_PLACES places."
    echo ""
    echo "eg. a trackpoint -33.88260 151.20653 would be removed if "
    echo "-33.88212 151.20699 is passed to the program and DEC_PLACES"
    echo "is 3 (the first 3 decimals places match)"
    exit
fi

lat=`./coordTrimmer.py $2 $4`
lon=`./coordTrimmer.py $3 $4`

#echo "Lat is $lat"
#echo "Lon is $lon"
#cat $1 | tr -d '\n' > temp
# echo $(cat $1) > temp
cat $1 | python -c "import sys; print(' '.join([ l.strip() for l in sys.stdin.readlines() ]))" | perl -pe "s/<trkpt lat=\"$lat[0-9]*\" lon=\"$lon[0-9]*\">.*?<\/trkpt>//g"


# The tens digit gives a position to about 1,000 kilometers. It gives us useful information about what continent or ocean we are on.
#
# The units digit (one decimal degree) gives a position up to 111 kilometers (60 nautical miles, about 69 miles). It can tell us roughly what large state or country we are in.
#
# The first decimal place is worth up to 11.1 km: it can distinguish the position of one large city from a neighboring large city.
#
# The second decimal place is worth up to 1.1 km: it can separate one village from the next.
#
# The third decimal place is worth up to 110 m: it can identify a large agricultural field or institutional campus.
#
# The fourth decimal place is worth up to 11 m: it can identify a parcel of land. It is comparable to the typical accuracy of an uncorrected GPS unit with no interference.
#
# The fifth decimal place is worth up to 1.1 m: it distinguish trees from each other. Accuracy to this level with commercial GPS units can only be achieved with differential correction.
#
# The sixth decimal place is worth up to 0.11 m: you can use this for laying out structures in detail, for designing landscapes, building roads. It should be more than good enough for tracking movements of glaciers and rivers. This can be achieved by taking painstaking measures with GPS, such as differentially corrected GPS.
#
#
# The seventh decimal place is worth up to 11 mm: this is good for much surveying and is near the limit of what GPS-based techniques can achieve.
#
# The eighth decimal place is worth up to 1.1 mm: this is good for charting motions of tectonic plates and movements of volcanoes. Permanent, corrected, constantly-running GPS base stations might be able to achieve this level of accuracy.
#
# The ninth decimal place is worth up to 110 microns: we are getting into the range of microscopy. For almost any conceivable application with earth positions, this is overkill and will be more precise than the accuracy of any surveying device.
#
# Ten or more decimal places indicates a computer or calculator was used and that no attention was paid to the fact that the extra decimals are useless. Be careful, because unless you are the one reading these numbers off the device, this can indicate low quality processing!
