#!/usr/bin/env bash
. env.sh

mkdir -p casts gif

demos=( \
    demo-get \
    demo-info \
    demo-meta \
    demo-diff \
)

for demo in ${demos[@]}; do
    echo Recoding demos:
    echo - $demo
    asciinema rec --overwrite casts/$demo.cast -c ./$demo.sh

    # SVG do not play in the readme in gitlab...
    # termtosvg render -t window_frame_js casts/$demo.cast svg/$demo.svg -D 3000

    asciicast2gif casts/$demo.cast gif/$demo.gif
done

rm -f *.wasm
