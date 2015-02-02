#! /bin/bash

if ! foobar_loc="$(type -p "svgexport")" || [ -z "$foobar_loc" ]; then
  echo "You need to install svexport, using 'npm i svgexport -g'"
  exit 1
fi

# Clean pngs folder
rm -rf ./pngs/*

# Convert to png equivalent
svgexport ./src/apple-touch-icon.svg ./pngs/apple-touch-icon-152.png 152:152

svgexport ./src/published-with-gitbook.svg ./pngs/published-with-gitbook.png

svgexport ./src/gitbook-white.svg ./pngs/512wt.png

svgexport ./src/gitbook-transparent.svg ./pngs/512t.png
svgexport ./src/gitbook-transparent.svg ./pngs/128t.png 128:128
svgexport ./src/gitbook-transparent.svg ./pngs/64t.png 64:64

svgexport ./src/gitbook.svg ./pngs/512.png
svgexport ./src/gitbook.svg ./pngs/128.png 128:128
svgexport ./src/gitbook.svg ./pngs/64.png 64:64
svgexport ./src/gitbook.svg ./pngs/32.png 32:32
svgexport ./src/gitbook.svg ./pngs/16.png 16:16

