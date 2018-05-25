#!/usr/bin/env python3

import json
import xmltodict
import dicttoxml
import sys

def pretty(o):
    print(json.dumps(o, indent=2))

def sufficient_distance(point):
    return True

# Import
data = sys.stdin.read()
track = xmltodict.parse(data) #,process_namespaces=True

# Get all the points
trkpts = track['gpx']['trk']['trkseg']['trkpt']

# Filter points
far_trkpts = [point for point in trkpts if sufficient_distance(point)]

# Export back to xml
xml = xmltodict.unparse(far_trkpts, pretty=True)

print(xml)
