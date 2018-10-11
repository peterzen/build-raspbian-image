#!/bin/bash

SOURCEDIR=$(dirname $0)

vmdebootstrap \
    --arch armhf \
    --distribution stretch \
    --mirror http://localhost:3142/archive.raspbian.org/raspbian \
    --image `date +raspbian-%Y%m%d.img` \
    --size 1G \
    --bootsize 64M \
    --boottype vfat \
    --root-password raspberry \
    --verbose \
    --no-kernel \
    --no-extlinux \
    --hostname wally \
    --roottype btrfs \
    --foreign /usr/bin/qemu-arm-static \
    --debootstrapopts="keyring=$SOURCEDIR/raspbian.org.gpg" \
    --customize "$SOURCEDIR/customize.sh"
