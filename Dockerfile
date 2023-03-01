FROM ubuntu:latest
MAINTAINER SHAKUGAN <shakugan@disbox.net>
RUN apt-get update && apt-get upgrade -y
RUN apt-get install wget curl nano xz-utils  -y
RUN mkdir Proot
WORKDIR Proot
RUN wget https://uk.lxd.images.canonical.com/images/ubuntu/focal/amd64/cloud/20230228_07:43/rootfs.tar.xz && tar -xf rootfs.tar.xz
RUN wget https://proot.gitlab.io/proot/bin/proot
RUN wget https://github.com/tmate-io/tmate/releases/download/2.4.0/tmate-2.4.0-static-linux-amd64.tar.xz && tar -xvf tmate-2.4.0-static-linux-amd64.tar.xz && rm -rf tmate-2.4.0-static-linux-amd64.tar.xz && mv tmate-2.4.0-static-linux-amd64/tmate tmate && rm -rf tmate-2.4.0-static-linux-amd64
#RUN echo "tar -xf Parrot-rootfs-5.2_amd64.tar.xz" >> /Parrot.sh
#RUN echo "ls" >> /Parrot.sh
#RUN echo "cd parrot-amd64 && ls" >> /Parrot.sh
#RUN echo "./proot -S . ./tmate -F" >> /Parrot.sh
RUN chmod 755 proot
RUN chmod 755 tmate
#RUN chmod 755 Parrot.sh
#CMD ./Parrot.sh
ENTRYPOINT ["/proot -S . ./tmate -F"]
