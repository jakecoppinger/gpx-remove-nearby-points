#!/usr/bin/env bash

echo $1
cat oneline.xml | perl -pe 's/<trkpt lat="-33\.919733[0-9]*" lon="151.2293265[0-9]*">.*?<\/trkpt>/LOLOLOL/g'

