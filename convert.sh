#! /bin/bash


if ! foobar_loc="$(type -p "svgexport")" || [ -z "$foobar_loc" ]; then
  echo "You need to install svexport, using 'npm i svgexport -g'"
  exit 1
fi

svgexport ./src/gitbook.svg ./pngs/gitbook.png
svgexport ./src/published-with-gitbook.svg ./pngs/published-with-gitbook.png
svgexport ./src/gitbook-white.svg ./pngs/gitbook-white.png
