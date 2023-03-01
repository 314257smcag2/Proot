FROM ubuntu:latest
MAINTAINER SHAKUGAN <shakugan@disbox.net>
RUN apt-get update && apt-get upgrade -y
RUN apt-get install wget curl nano xz-utils  -y
RUN wget https://deb.parrot.sh/parrot/iso/5.2-1/Parrot-rootfs-5.2_amd64.tar.xz
RUN tar -xf Parrot-rootfs-5.2_amd64.tar.xz >> Parrot.txt &
RUN ls
RUN wget https://proot.gitlab.io/proot/bin/proot && mv proot parrot-amd64/proot && chmod +x proot && chmod 755 proot
RUN cd parrot-amd64 && wget https://github.com/tmate-io/tmate/releases/download/2.4.0/tmate-2.4.0-static-linux-amd64.tar.xz && tar -xvf tmate-2.4.0-static-linux-amd64.tar.xz && rm -rf tmate-2.4.0-static-linux-amd64.tar.xz && mv tmate-2.4.0-static-linux-amd64/tmate tmate && rm -rf tmate-2.4.0-static-linux-amd64 && chmod +x tmate && chmod 755 tmate 
WORKDIR /parrot-amd64
ENTRYPOINT ["/proot -S . ./tmate -F"]
