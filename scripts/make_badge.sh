#!/bin/sh
# Usage: scripts/make_badge.sh <slug> "<Name>" <logo-file> [fill]   (earned plaque)
#   fill (optional): "square"        logo is a full-bleed square, fill the plate
#                    "circle:<#hex>" logo is a disc on white, fill the plate with <#hex>
#        scripts/make_badge.sh locked                         (empty slot)
# Writes assets/contributed-to/hall-<slug>.png (300x360): dark plaque, thin gold
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
  plaque "$OUT/hall-empty.png"
  magick "$OUT/hall-empty.png" -fill '#21262d' -stroke '#30363d' -strokewidth 2 \
    -draw "roundrectangle 75,45 225,195 22,22" \
    -stroke none -fill '#484f58' -font "$F" -pointsize 96 -gravity north -annotate +0+82 '?' \
    -fill '#30363d' -draw "rectangle 90,232 210,233" \
    -fill '#7d8590' -pointsize 32 -annotate +0+262 'TO UNLOCK' "$OUT/hall-empty.png"
  exit 0
fi
slug=$1; name=$2; logo=$3; fill=$4
T=$(mktemp -d)
trap 'rm -rf "$T"' EXIT
# art layer: 146x146 with rounded corners, sits in a 150x150 white plate (2px edge)
case "$fill" in
  square)
    magick "$logo" -background white -alpha remove -alpha off -resize 146x146^ -gravity center -extent 146x146 "$T/art.png" ;;
  circle:*)
    magick -size 146x146 xc:"${fill#circle:}" \
      \( "$logo" -background white -alpha remove -alpha off -resize 146x146 \( -size 146x146 xc:black -fill white -draw 'circle 73,73 73,1' \) \
         -alpha off -compose copy_opacity -composite \) \
      -compose over -composite "$T/art.png" ;;
  *)
    magick -size 146x146 xc:white \( "$logo" -background white -resize 118x118 \) \
      -gravity center -compose over -composite "$T/art.png" ;;
esac
magick -size 146x146 xc:black -fill white -draw 'roundrectangle 0,0 145,145 20,20' "$T/mask.png"
magick "$T/art.png" "$T/mask.png" -alpha off -compose copy_opacity -composite "$T/art.png"
plaque "$OUT/hall-$slug.png"
magick "$OUT/hall-$slug.png" -fill white -stroke none -draw "roundrectangle 75,45 225,195 22,22" \
  "$T/art.png" -gravity none -geometry +77+47 -compose over -composite \
  -fill "$GOLD" -draw "rectangle 90,232 210,233" \
  -fill '#e6edf3' -font "$F" -pointsize 38 -gravity north -annotate +0+248 "$name" \
  -fill "$GOLD" -pointsize 26 -annotate +0+302 'MERGED' "$OUT/hall-$slug.png"
