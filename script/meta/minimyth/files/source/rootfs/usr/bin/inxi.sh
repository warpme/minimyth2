#!/bin/sh

export HOME="/root"
su minimyth -c "/usr/bin/inxi --full --audio --cpu --display --bluetooth --usb --network-advanced --color 0"

exit 0
