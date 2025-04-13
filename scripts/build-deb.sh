#!/bin/bash
set -e

readonly TARGET=target
readonly SOURCE=src

mkdir "$TARGET"

# Control File
cp -vr $SOURCE/DEBIAN $TARGET

# Binary File
mkdir -p $TARGET/usr/bin
cp -vr $SOURCE/bin $TARGET/usr
chmod 755 $TARGET/usr/bin/*

fakeroot dpkg-deb --build -Zxz $TARGET
dpkg-name ${TARGET}.deb

DEBFILE=$(ls ./*.deb)

sha256sum "$DEBFILE" >"$DEBFILE.sha256sum"
sha512sum "$DEBFILE" >"$DEBFILE.sha512sum"

dpkg --contents "$DEBFILE"
