#!/bin/bash
set -e

git checkout master
git pull
git branch -D green/passwall
git checkout green/passwall

./scripts/feeds update -a
./scripts/feeds install -a

make menuconfig

# Write the changes to diffconfig
./scripts/diffconfig.sh > diffconfig
