#!/bin/sh
# Usage: scripts/make_badge.sh <slug> <logo-file>   (earned badge)
#        scripts/make_badge.sh locked                (empty slot)
# Writes assets/contributed-to/tile-<slug>.png (300x360): white rounded square
# with the logo and "MERGED" under it. Transparent background, works on light and dark.
set -e
F=/usr/share/fonts/liberation-sans-fonts/LiberationSans-Bold.ttf
OUT=assets/contributed-to
GOLD='#d4a72c'
if [ "$1" = locked ]; then
  magick -size 300x360 xc:none -fill '#21262d' -stroke '#484f58' -strokewidth 4 \
    -draw "roundrectangle 12,12 287,287 48,48" \
    -stroke none -fill '#7d8590' -font "$F" -pointsize 150 -gravity north -annotate +0+70 '?' \
    -pointsize 38 -annotate +0+300 'TO UNLOCK' "$OUT/tile-empty.png"
  exit 0
fi
slug=$1; logo=$2
magick -size 300x360 xc:none -fill white -stroke '#d0d7de' -strokewidth 2 \
  -draw "roundrectangle 12,12 287,287 48,48" \
  \( "$logo" -background white -resize 190x190 \) -gravity none -geometry +55+55 -compose over -composite \
  -stroke none -fill "$GOLD" -font "$F" -pointsize 44 -gravity north -annotate +0+300 'MERGED' \
  "$OUT/tile-$slug.png"
