GPX Remove Nearby Points
========================

>   Remove points in a GPX (GPS) trace that match a given coordinate to a given
>   number of decimal places

For example, a trackpoint -33.88260 151.20653 would be removed if
33.88212 151.20699 is passed to the program and DEC_PLACES
is 3 (the first 3 decimals places match)

For example: Removing points nearby to your home when uploading a trace to
OpenStreetMap.

# Usage

Remove all points in a GPX GPS trace that match the given coordinate to 3
decimal places

./gpc-remove-nearby-points.sh LATITUDE LONGITUDE DEC_PLACES

```
cat input.gpx | ./gpc-remove-nearby-points.sh -33.8834,151.2065 3 > output.gpx
```

# Author
Jake Coppinger  
<[jake@jakecoppinger.com](mailto:jake@jake@jakecoppinger.com)>  
([https://jakecoppinger.com](https://jakecoppinger.com)) 