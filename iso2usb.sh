#!/bin/bash

set -ex

DEV=$1 # get this with diskutil list
ISO=${ISO-ubuntu-14.04.3-server-amd64.iso}
IMG=${ISO}.dmg

# https://help.ubuntu.com/community/Installation/FromUSBStick/
hdiutil convert -format UDRW -o "$IMG" "$ISO" || true
diskutil unmountDisk "$DEV"
sudo dd if="$IMG" of="$DEV" bs=1m
diskutil eject "$DEV"
