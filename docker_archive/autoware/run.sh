#!/bin/sh
XSOCK=/tmp/.X11-unix
XAUTH=/home/$USER/.Xauthority

docker run \
    --runtime=nvidia \
    -it \
    --net=host \
	--name docker_autoware \
    --env="XAUTHORITY=${XAUTH}" \
    --env="DISPLAY=${DISPLAY}" \
	--env="XDG_RUNTIME_DIR=/run/user/1000" \
    --privileged \
	-v /run/user/1000:/run/user/1000 \
	-v /dev/bus/usb:/dev/bus/usb \
    -v $XSOCK:$XSOCK:rw \
    -v $XAUTH:$XAUTH:rw \
    -v $HOST_DIR:$SHARED_DIR:rw \
	-v /home/dyros-vehicle/share_docker:/home/autoware/share_docker \
	-v /media/dyros-data/datasets:/home/autoware/datasets \
	-v /media/dyros-data/bag_files:/home/autoware/bag_files \
	edward0im/dyrosvehicle:ubuntu_autoware
