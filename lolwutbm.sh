#!/bin/bash

# Print header row
echo "\"Terminal columns\", \"Squares per row\", \"Squares per col\", \"Ops\""

for sc in `seq 0 10 100`; do
  for sr in `seq 0 10 100`; do
    for tc in `seq 0 10 100`; do
      rep=`redis-benchmark -n 10000 --csv LOLWUT $tc $sr $sc`
      IFS=',' read -ra res <<< "$rep"
      echo "$tc, $sr, $sc, ${res[1]}"
    done
  done
done

echo
