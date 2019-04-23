#!/bin/sh

docker pull nibs/drocker

docker rm -f drocker
docker run -d --name drocker nibs/drocker
if [ -d ./web.old ]; then
  sudo rm -rf ./web.old
fi
if [ -d ./web ]; then
  mv ./web ./web.old
fi
sudo docker cp drocker:/var/www/html ./web
docker stop drocker
docker rm drocker

sudo chown -R $USER ./web
sudo chmod -R g+w ./web

