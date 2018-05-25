#!/usr/bin/env python3

import json
import xmltodict
import dicttoxml
import sys

from sufficient_distance_away import sufficient_distance_away

def pretty(o):
    print(json.dumps(o, indent=2))

def gpx_point_to_point(gpx_point):
    return (float(gpx_point['@lat']), float(gpx_point['@lon']))

def transform_track(track):
    new_points = [point for point in track['trkseg']['trkpt'] if 
        sufficient_distance_away(gpx_point_to_point(point), position, distance)]
    return {'trkseg':{'trkpt':new_points }}

args = sys.argv[1:]
if len(args) != 2:
    raise AssertionError("Please give 2 args where lat & long separated by comma: latitude,longitude distance")

if ',' not in args[0]:
    raise AssertionError("No comma in between lat and long")

latitude, longitude = [float(x) for x in args[0].split(',')]
position = (latitude, longitude)
distance = float(args[1])

# Import
xml_data = sys.stdin.read()
data_object = xmltodict.parse(xml_data)

# Filter points
num_tracks = len(data_object['gpx']['trk'])
if num_tracks == 0:
    raise Exception("There doesn't appear to be a track in the data.")
elif num_tracks == 1:
    data_object['gpx']['trk'] = transform_track(data_object['gpx']['trk'])
else:
    new_tracks = [transform_track(track) for track in data_object['gpx']['trk']]
    data_object['gpx']['trk'] = new_tracks

# Export back to xml
xml = xmltodict.unparse(data_object, pretty=True)

print(xml)

# Pretty print JSON
# pretty(data_object['gpx']['trk'])