#!/bin/bash
set -e

make dirclean
rm -rf .ccache
rm -rf dl
rm -rf build_dir
rm -rf staging_dir

git checkout master
git pull
git branch -D green/passwall
git checkout green/passwall

./scripts/feeds clean
