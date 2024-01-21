#!/bin/bash

for i in *.dot
do
    echo "$i => ${i%%.dot}.svg"
    dot -Tsvg $i > ${i%%.dot}.svg
done
