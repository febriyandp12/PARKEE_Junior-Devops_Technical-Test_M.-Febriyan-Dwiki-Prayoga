#!/bin/bash

DIR=$1

if [ -z "$DIR" ]; then
  echo "Usage: $0 <directory>"
  exit 1
fi

printf "%-30s %10s %10s %10s\n" "Filename" "Lines" "Words" "Chars"
echo "--------------------------------------------------------------------------"

find "$DIR" -type f -name "*.txt" | while read file; do
  lines=$(wc -l < "$file")
  words=$(wc -w < "$file")
  chars=$(wc -m < "$file")
  printf "%-30s %10d %10d %10d\n" "$(basename "$file")" "$lines" "$words" "$chars"
done