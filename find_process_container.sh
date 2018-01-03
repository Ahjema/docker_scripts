#!/bin/sh
#This script will look for a process name on a host, and tell you which container is running it.
#usage is:
#./script_name.sh process
#example ./find_process_container.sh gunicorn

for i in `ps -ef | grep $1 | awk '{print $3}'`; do pbrun docker ps -q | xargs pbrun docker inspect --format '{{.State.Pid}}, {{.Name}}' | grep $i; done
