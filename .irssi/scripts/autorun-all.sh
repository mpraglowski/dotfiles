#!/usr/bin/env bash
cd autorun
for filename in ../*.pl; do ln -s ../$filename .; done
