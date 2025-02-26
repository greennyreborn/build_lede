#!/bin/bash
set -e

make -j8 download
make -j1 V=s

echo 'copy image...'
cp -r bin/targets/x86/64/openwrt-x86-64-generic-squashfs-combined-efi.img.gz /home/lede/build/images/
echo 'copy image success'
