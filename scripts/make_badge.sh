#!/bin/sh
# Usage: scripts/make_badge.sh <slug> "<Name>" <logo-file>   (earned plaque)
#        scripts/make_badge.sh locked                         (empty slot)
# Writes assets/contributed-to/hof-<slug>.png (300x360): dark plaque, thin gold
# edge, small white logo plate, name and MERGED. Transparent corners.
# GitHub caches README images by URL: rename the prefix when the look changes.
set -e
F=/usr/share/fonts/liberation-sans-fonts/LiberationSans-Bold.ttf
OUT=assets/contributed-to
GOLD='#d4a72c'; EDGE='#6b5416'; CARD='#161b22'
plaque() {
  magick -size 300x360 xc:none -fill "$CARD" -stroke "$EDGE" -strokewidth 3 \
    -draw "roundrectangle 2,2 297,357 24,24" "$1"
}
if [ "$1" = locked ]; then
  plaque "$OUT/hof-empty.png"
  magick "$OUT/hof-empty.png" -fill '#21262d' -stroke '#30363d' -strokewidth 2 \
    -draw "roundrectangle 75,45 225,195 22,22" \
    -stroke none -fill '#484f58' -font "$F" -pointsize 96 -gravity north -annotate +0+82 '?' \
    -fill '#30363d' -draw "rectangle 90,232 210,233" \
    -fill '#7d8590' -pointsize 32 -annotate +0+262 'TO UNLOCK' "$OUT/hof-empty.png"
  exit 0
fi
slug=$1; name=$2; logo=$3
plaque "$OUT/hof-$slug.png"
magick "$OUT/hof-$slug.png" -fill white -stroke none \
  -draw "roundrectangle 75,45 225,195 22,22" \
  \( "$logo" -background white -resize 118x118 \) -gravity none -geometry +91+61 -compose over -composite \
  -fill "$GOLD" -draw "rectangle 90,232 210,233" \
  -fill '#e6edf3' -font "$F" -pointsize 38 -gravity north -annotate +0+248 "$name" \
  -fill "$GOLD" -pointsize 26 -annotate +0+302 'MERGED' "$OUT/hof-$slug.png"
