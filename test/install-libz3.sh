#!/bin/sh

# Advent of Code 2018
#
# Robert Haines
#
# Public Domain

set -ex

Z3_DIR=z3-4.8.4.d6df51951f4c-x64-ubuntu-14.04
Z3_ZIP=${Z3_DIR}.zip
Z3_DL=https://github.com/Z3Prover/z3/releases/download/z3-4.8.4/${Z3_ZIP}

wget ${Z3_DL}
unzip ${Z3_ZIP}
