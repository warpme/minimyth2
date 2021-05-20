#!/bin/sh

export HOME="/root"
su minimyth -c "/usr/bin/inxi --tty --full --audio --cpu --display --bluetooth --usb --network-advanced --color 0 -xx -usb"

exit 0
