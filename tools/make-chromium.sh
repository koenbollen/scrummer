#!/bin/bash
#
# This script assumes a linux environment

echo "*** scrummer(Chromium): Creating package"
echo "*** scrummer(Chromium): Copying files"

DES=./dist/build/scrummer.chromium
rm -rf $DES
mkdir -p $DES
mkdir -p $DES/img/

cp -R ./src/*                           $DES/
cp -R ./platform/chromium/img/*         $DES/img/
cp    ./platform/chromium/manifest.json $DES/

if [ "$1" = all ]; then
    echo "*** scrummer.chromium: Creating package..."
    pushd $(dirname $DES/)
    zip scrummer.chromium.zip -qr $(basename $DES/)/*
    popd
fi

echo "*** scrummer(Chromium): Package done."
