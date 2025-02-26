#!/bin/bash
set -e

git checkout master
git pull
git branch -D green/passwall
git checkout green/passwall

./scripts/feeds update -a
./scripts/feeds install -a

# Write changes to .config
cp diffconfig .config

# Expand to full config
make defconfig

make -j8 download
make -j$(($(nproc) + 1)) V=s

echo 'copy image...'
cp -r bin/targets/x86/64/openwrt-x86-64-generic-squashfs-combined-efi.img.gz /home/lede/build/images
echo 'copy image success'
