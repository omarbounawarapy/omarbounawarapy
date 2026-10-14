#!/bin/sh
# Usage: scripts/make_badge.sh <slug> "<Name>" <logo-file>   (earned badge)
#        scripts/make_badge.sh locked                         (empty slot)
# Writes assets/contributed-to/badge-<slug>.png (400x480, dark card, gold medallion).
set -e
F=/usr/share/fonts/liberation-sans-fonts/LiberationSans-Bold.ttf
OUT=assets/contributed-to
CARD='#161b22'; EDGE='#30363d'; GOLD='#d4a72c'
card() {
  magick -size 400x480 xc:none -fill "$CARD" -stroke "$EDGE" -strokewidth 4 \
    -draw "roundrectangle 2,2 397,477 36,36" "$1"
}
if [ "$1" = locked ]; then
  card "$OUT/badge-locked.png"
  magick "$OUT/badge-locked.png" -stroke "$EDGE" -strokewidth 6 -fill none \
    -draw "circle 200,200 200,296" \
    -stroke none -fill "$EDGE" -font "$F" -pointsize 112 -gravity north -annotate +0+144 '?' \
    -pointsize 32 -annotate +0+368 'TO UNLOCK' "$OUT/badge-locked.png"
  exit 0
fi
slug=$1; name=$2; logo=$3
card "$OUT/badge-$slug.png"
magick "$OUT/badge-$slug.png" -stroke "$GOLD" -strokewidth 6 -fill white \
  -draw "circle 200,200 200,296" \
  \( "$logo" -background white -resize 184x184 -gravity center -extent 184x184 \
     \( -size 184x184 xc:black -fill white -draw "circle 92,92 92,0" \) \
     -alpha off -compose copy_opacity -composite \) \
  -gravity none -geometry +108+108 -compose over -composite \
  -stroke none -fill '#e6edf3' -font "$F" -pointsize 48 -gravity north -annotate +0+336 "$name" \
  -fill "$GOLD" -pointsize 30 -annotate +0+408 'MERGED' \
  "$OUT/badge-$slug.png"
