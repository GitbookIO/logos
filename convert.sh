#! /bin/bash

if ! foobar_loc="$(type -p "svgexport")" || [ -z "$foobar_loc" ]; then
  echo "You need to install svexport, using 'npm i svgexport -g'"
  exit 1
fi

# Clean pngs folder
rm -rf ./pngs/*

## Logos with text
svgexport ./src/gitbook-text.svg ./pngs/512-text.png 512:102

## Google Apps
svgexport ./src/gitbook-text.svg ./pngs/320-text-tmp.png 320:
convert ./pngs/320-text-tmp.png -gravity center -background transparent -extent 320x132 ./pngs/320-text.png
rm ./pngs/320-text-tmp.png

## Logos
svgexport ./src/gitbook-white.svg ./pngs/512wt.png

svgexport ./src/gitbook-transparent.svg ./pngs/512t.png
svgexport ./src/gitbook-transparent.svg ./pngs/128t.png 128:128
svgexport ./src/gitbook-transparent.svg ./pngs/64t.png 64:64

svgexport ./src/gitbook.svg ./pngs/512.png
svgexport ./src/gitbook.svg ./pngs/128.png 128:128
svgexport ./src/gitbook.svg ./pngs/64.png 64:64
svgexport ./src/gitbook.svg ./pngs/32.png 32:32
svgexport ./src/gitbook.svg ./pngs/16.png 16:16

## Apple
svgexport ./src/apple-touch-icon.svg ./pngs/apple-touch-icon-152.png 152:152

## Facebook
svgexport ./src/facebook-tile.svg ./pngs/tile-facebook.png 1200x630

## Book cover
svgexport ./src/published-with-gitbook.svg ./pngs/published-with-gitbook.png

# Favicon
convert ./pngs/32.png ./pngs/favicon.ico

# Optimize PNGs (by a lot ...)
find ./pngs/ -name "*.png" | xargs -P 4 -I{} convert {} {}
