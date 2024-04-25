#!/usr/bin/env bash

path="$1"
orig_color="$2"
new_color="$3"

if [ -z "$path" ] || [ -z "$orig_color" ] || [ -z "$new_color" ]; then
  echo "Usage: change-color.sh PATH ORIG_COLOR NEW_COLOR"
fi

path="$(realpath "$path")"

find "$path" -type f -printf '%p\0' | xargs -0 --replace='{}' -n 1 -P "$(nproc)" -- sed -i -e "s/$orig_color/$new_color/gI" '{}'

