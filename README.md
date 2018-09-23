GPX Remove Nearby Points
========================

Removes all GPX (GPS) track points that match the given coordinate
to DEC_PLACES places.

eg. a trackpoint -33.88260 151.20653 would be removed if
-33.88212 151.20699 is passed to the program and DEC_PLACES
is 3 (the first 3 decimals places match)
    
1st dec place: worth up to 11.1km
2st: 1.1km
3rd: 110m
4th: 11m
5th: 1.1m
6th: 0.11m
7th: 11mm
8th: 1.1mm
(from [https://gis.stackexchange.com/questions/8650/measuring-accuracy-of-latitude-and-longitude/8674#8674])

# Why?

For example: Removing points nearby to your home when uploading a trace to OpenStreetMap.

# Usage

Remove all points in a GPX GPS trace that match the given coordinate to 3
decimal places

./gpc-remove-nearby-points.sh FILENAME LATITUDE LONGITUDE DEC_PLACES

```
./gpc-remove-nearby-points.sh input.gpx -33.8834,151.2065 3 > output.gpx
```

# Author
Jake Coppinger  
<[jake@jakecoppinger.com](mailto:jake@jake@jakecoppinger.com)>  
([https://jakecoppinger.com](https://jakecoppinger.com)) 
