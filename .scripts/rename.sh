#!/bin/sh

num=0; for i in *; do mv "$i" "$(printf '%04d' $num).${i#*.}"; ((num++)); done
