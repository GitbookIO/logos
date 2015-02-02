#! /bin/bash


if ! foobar_loc="$(type -p "svgexport")" || [ -z "$foobar_loc" ]; then
  echo "You need to install svexport, using 'npm i svgexport -g'"
  exit 1
fi

svgexport ./gitbook.svg ./gitbook.png
svgexport ./published-with-gitbook.svg ./published-with-gitbook.png
svgexport ./gitbook-white.svg ./gitbook-white.png
