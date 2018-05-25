GPX Remove Nearby Points
========================

>   Remove points in a GPX (GPS) trace within a specified distance to a point

For example: Removing points nearby to your home when uploading a trace to OpenStreetMap.

# Example Usage

Remove all points in a GPX GPS trace within 300 metres of Central Station, Sydney

```
cat input.gpx | ./gpx-remove-nearby-points.py -33.8834,151.2065 300 > output.gpx
```

# Installing required packages

```
pip3 install xmltodict dicttoxml geopy
```

Or:

```
pip3 install -r requirements.txt 
```

# Run tests

```
./test_sufficient_distance_away.py
```

# Author
Jake Coppinger  
<[jake@jakecoppinger.com](mailto:jake@jake@jakecoppinger.com)>  
([https://jakecoppinger.com](https://jakecoppinger.com)) 