#!/bin/sh
#this script will find the usage of every container on a host
docker stats --no-stream `docker ps --format "{{.Names}}"`
