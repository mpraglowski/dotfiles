#!/usr/bin/env bash
cd autorun
rm *.pl
for filename in ../*.pl; do ln -s $filename .; done
