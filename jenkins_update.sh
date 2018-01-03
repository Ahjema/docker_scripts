#!/bin/sh
#this script will update (or install and update after) a jenkins server. It uses a docker volume to retain settings/configs)

#stops current jenkins (if named jenkins)
docker stop jenkins

#for science
sleep 5

#Delete stopped jenkins container
docker rm jenkins

#Delete all 'untagged/dangling' (<none>) images - comment this out if it makes you nervous
docker rmi $(docker images -q -f dangling=true)

#Downloads and starts the new LTS jenkins container
docker run -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home --restart=always --name jenkins jenkins/jenkins:lts 
