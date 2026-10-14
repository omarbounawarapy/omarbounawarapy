#!/bin/sh
# Usage: scripts/make_badge.sh <slug> <logo-file>   (earned badge)
#        scripts/make_badge.sh locked                (empty slot)
# Writes assets/contributed-to/badge-<slug>.png: 128x128 medallion, gold ring.
set -e
OUT=assets/contributed-to
if [ "$1" = locked ]; then
  F=/usr/share/fonts/liberation-sans-fonts/LiberationSans-Bold.ttf
  magick -size 128x128 xc:none -fill '#161b22' -stroke '#30363d' -strokewidth 4 \
    -draw "circle 64,64 64,5" -stroke none -fill '#30363d' -font "$F" \
    -pointsize 64 -gravity center -annotate +0+0 '?' "$OUT/badge-locked.png"
  exit 0
fi
slug=$1; logo=$2
magick -size 128x128 xc:none -fill '#d4a72c' -draw "circle 64,64 64,2" \
  \( "$logo" -background white -resize 110x110 -gravity center -extent 110x110 \
     \( -size 110x110 xc:black -fill white -draw "circle 55,55 55,0" \) \
     -alpha off -compose copy_opacity -composite \) \
  -gravity center -compose over -composite "$OUT/badge-$slug.png"
