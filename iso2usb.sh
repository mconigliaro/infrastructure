#!/bin/bash
#
# Usage: ./iso2usb <device> <iso>
# Example: ./iso2usb.sh /dev/disk1 ~/Downloads/ubuntu-16.04.2-server-amd64.iso
#
set -ex

DEV=$1 # Get the device name with `diskutil list`
ISO=$2 # Path to ISO
IMG=${ISO}.dmg

# https://help.ubuntu.com/community/How%20to%20install%20Ubuntu%20on%20MacBook%20using%20USB%20Stick
hdiutil convert -format UDRW -o "$IMG" "$ISO" || true
diskutil unmountDisk "$DEV"
sudo dd if="$IMG" of="$DEV" bs=1m
diskutil eject "$DEV"
