#!/bin/bash
set -e

rm -rf ~/rpmbuild
rpmdev-setuptree

readonly SOURCE=src
readonly TARGET=~/rpmbuild/BUILD/

# Spec File
cp $SOURCE/RPMS/siakhooi-cerg.spec ~/rpmbuild/SPECS

# Binary File
mkdir -p $TARGET/usr/bin
cp -vr $SOURCE/bin $TARGET/usr
chmod 755 $TARGET/usr/bin/*

# License
cp -vf ./LICENSE "$TARGET"

# build rpm file
rpmlint ~/rpmbuild/SPECS/siakhooi-cerg.spec
rpmbuild -bb -vv ~/rpmbuild/SPECS/siakhooi-cerg.spec
cp -vf ~/rpmbuild/RPMS/noarch/siakhooi-cerg-*.rpm .

# query
tree ~/rpmbuild/
rpm -ql ~/rpmbuild/RPMS/noarch/siakhooi-cerg-*.rpm

rpm_file=$(basename "$(ls ./siakhooi-cerg-*.rpm)")

sha256sum "$rpm_file" >"$rpm_file.sha256sum"
sha512sum "$rpm_file" >"$rpm_file.sha512sum"
