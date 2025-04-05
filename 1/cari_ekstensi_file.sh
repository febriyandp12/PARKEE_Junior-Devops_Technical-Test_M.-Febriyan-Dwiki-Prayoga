#!/bin/bash

DIR=$1
EXT=$2

if [ -z "$DIR" ] || [ -z "$EXT" ]; then
  echo "Usage: $0 <directory> <extension>"
  exit 1
fi

echo "Mencari file *.$EXT di dalam direktori $DIR"
find "$DIR" -type f -name "*.$EXT"