#!/bin/sh
docker build -t tidocker - <<DOCKERFILE_EOF || exit 1
from ubuntu:19.10
run sed -i 's/\/\/[a-z.]*archive.ubuntu.com/\/\/mirror.kakao.com/g' /etc/apt/sources.list
run apt-get update
run apt-get install -y git sudo bash make nano
run dpkg --add-architecture i386
run apt-get update
run git clone https://github.com/kookmin-cat/TIdocker.git /tmp/setting/
workdir /tmp/setting/
run bash env_setup.sh
cmd bash -i
workdir /tmp/
DOCKERFILE_EOF
#docker run -it --rm --cap-add=SYS_PTRACE --security-opt seccomp=unconfined glibc223
docker run -it --network my-server --name tidocker -v ~/private/develop:/tmp/share --privileged --cap-add=SYS_PTRACE --security-opt seccomp=unconfined tidocker
