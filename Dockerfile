FROM ubuntu:latest
MAINTAINER SHAKUGAN <shakugan@disbox.net>
RUN apt-get update && apt-get upgrade -y
RUN apt-get install wget curl nano xz-utils  -y
RUN mkdir Proot
RUN cd Proot && wget https://uk.lxd.images.canonical.com/images/ubuntu/focal/amd64/cloud/20230228_07:43/rootfs.tar.xz && tar -xf rootfs.tar.xz
RUN cd Proot && wget https://proot.gitlab.io/proot/bin/proot
RUN cd Proot && wget https://github.com/tmate-io/tmate/releases/download/2.4.0/tmate-2.4.0-static-linux-amd64.tar.xz && tar -xvf tmate-2.4.0-static-linux-amd64.tar.xz && rm -rf tmate-2.4.0-static-linux-amd64.tar.xz && mv tmate-2.4.0-static-linux-amd64/tmate tmate && rm -rf tmate-2.4.0-static-linux-amd64
RUN cd Proot && chmod 755 proot
RUN cd Proot && chmod 755 tmate
WORKDIR Proot
CMD ls && ./proot -S . ./tmate -F
