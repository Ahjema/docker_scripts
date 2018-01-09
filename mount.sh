#!/bin/sh

#containers wont fire up an external mount so I trigger it with this script. my entry is this script + command
#docker run --rm --privileged=true --entrypoint /apps/mount.sh image_name "bash /command/inside/container/or/script.sh"

mount /mount/point/from/etc/fstab

Executes the part AFTER the mount.sh
exec $1
