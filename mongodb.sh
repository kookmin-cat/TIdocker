#!/bin/sh
docker network create -d bridge my-server
docker build -t mongo_server - <<DOCKERFILE_EOF || exit 1
from mongo
run dpkg --add-architecture i386
run sed -i 's/\/\/[a-z.]*archive.ubuntu.com/\/\/mirror.kakao.com/g' /etc/apt/sources.list
run apt-get update
run apt-get install -y git sudo bash make nano net-tools
run apt-get install -y libc6:i386 libncurses5:i386 libstdc++6:i386
workdir /tmp/setting/
DOCKERFILE_EOF
docker run --network my-server --name mongo_server -v /Users/j._.n3utr0n/Desktop/develop/tibot/db:/data/db -d -p 16010:27017 -e MONGO_INITDB_ROOT_USERNAME=root -e MONGO_INITDB_ROOT_PASSWORD=asdd mongo_server --auth
