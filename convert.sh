#! /bin/bash

if ! foobar_loc="$(type -p "svgexport")" || [ -z "$foobar_loc" ]; then
  echo "You need to install svexport, using 'npm i svgexport -g'"
  exit 1
fi

# Clean pngs folder
rm -rf ./output/*

## Logos with text
svgexport ./src/gitbook-text.svg ./output/512-text.png 512:102

## Google Apps
svgexport ./src/gitbook-text.svg ./output/320-text-tmp.png 320:
convert ./output/320-text-tmp.png -gravity center -background transparent -extent 320x132 ./output/320-text.png
rm ./output/320-text-tmp.png

## Logos
svgexport ./src/gitbook-white.svg ./output/512wt.png

svgexport ./src/gitbook-transparent.svg ./output/512t.png
svgexport ./src/gitbook-transparent.svg ./output/128t.png 128:128
svgexport ./src/gitbook-transparent.svg ./output/64t.png 64:64

svgexport ./src/gitbook.svg ./output/1024.png 1024:1024
svgexport ./src/gitbook.svg ./output/512.png 512:512
svgexport ./src/gitbook.svg ./output/256.png 256:256
svgexport ./src/gitbook.svg ./output/128.png 128:128
svgexport ./src/gitbook.svg ./output/64.png 64:64
svgexport ./src/gitbook.svg ./output/32.png 32:32
svgexport ./src/gitbook.svg ./output/16.png 16:16

## Apple
svgexport ./src/apple-touch-icon.svg ./output/apple-touch-icon-152.png 152:152

## Facebook
svgexport ./src/facebook-tile.svg ./output/tile-facebook.png 1200x630

## Book cover
svgexport ./src/published-with-gitbook.svg ./output/published-with-gitbook.png

# Favicon
convert ./output/32.png ./output/favicon.ico
convert ./output/256.png ./output/windows_256.ico

# Optimize PNGs (by a lot ...)
find ./output/ -name "*.png" | xargs -P 4 -I{} convert {} {}

# Create Iconset
rm -rf logo.iconset
mkdir logo.iconset
cp ./output/1024.png ./logo.iconset/icon_512x512@2x.png
cp ./output/512.png ./logo.iconset/icon_512x512.png
cp ./output/512.png ./logo.iconset/icon_256x256@2x.png
cp ./output/256.png ./logo.iconset/icon_256x256.png
cp ./output/256.png ./logo.iconset/icon_128x128@2x.png
cp ./output/128.png ./logo.iconset/icon_128x128.png
cp ./output/64.png ./logo.iconset/icon_32x32@2x.png
cp ./output/32.png ./logo.iconset/icon_32x32.png
cp ./output/32.png ./logo.iconset/icon_16x16@2x.png
cp ./output/16.png ./logo.iconset/icon_16x16.png

# Icns for mac
iconutil -c icns logo.iconset
mv ./logo.icns ./output/mac.icns
