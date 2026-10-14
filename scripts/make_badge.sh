#!/bin/sh
# Usage: scripts/make_badge.sh <slug> "<Name>" <logo-file>   (earned badge)
#        scripts/make_badge.sh locked                         (empty slot)
# Writes assets/contributed-to/badge-<slug>.png (200x240, dark card, medallion).
set -e
F=/usr/share/fonts/liberation-sans-fonts/LiberationSans-Bold.ttf
OUT=assets/contributed-to
CARD='#161b22'; EDGE='#30363d'
base() {
  magick -size 200x240 xc:none -fill "$CARD" -stroke "$EDGE" -strokewidth 2 \
    -draw "roundrectangle 1,1 198,238 18,18" "$1"
}
if [ "$1" = locked ]; then
  base "$OUT/badge-locked.png"
  magick "$OUT/badge-locked.png" -stroke '#30363d' -strokewidth 3 -fill none \
    -draw "circle 100,100 100,148" \
    -stroke none -fill '#30363d' -font "$F" -pointsize 56 -gravity north -annotate +0+72 '?' \
    -pointsize 14 -annotate +0+184 'TO UNLOCK' "$OUT/badge-locked.png"
  exit 0
fi
slug=$1; name=$2; logo=$3
magick -size 200x240 xc:none -fill "$CARD" -stroke "$EDGE" -strokewidth 2 \
  -draw "roundrectangle 1,1 198,238 18,18" \
  -stroke '#d4a72c' -strokewidth 3 -fill white -draw "circle 100,100 100,148" \
  \( "$logo" -background white -resize 92x92 -gravity center -extent 92x92 \
     \( -size 92x92 xc:black -fill white -draw "circle 46,46 46,0" \) -alpha off -compose copy_opacity -composite \) \
  -gravity none -geometry +54+54 -compose over -composite \
  -stroke none -fill '#e6edf3' -font "$F" -pointsize 22 -gravity north -annotate +0+168 "$name" \
  -fill '#d4a72c' -pointsize 13 -annotate +0+204 'MERGED' \
  "$OUT/badge-$slug.png"
