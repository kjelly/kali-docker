FROM kalilinux/kali-linux-docker:latest

MAINTAINER Kuo-tung Kao

ENV TERM xterm-256color
ENV LC_ALL=C

RUN apt-get update -y
RUN apt-get install -y software-properties-common && apt-get update -y
RUN apt-get install -y kali-linux-full --fix-missing
RUN apt-get install -y git colordiff colortail unzip vim tmux xterm zsh curl telnet strace ltrace tmate fish neovim
RUN updatedb

RUN git clone https://github.com/kjelly/auto_config /auto_config
RUN bash /auto_config/install-deb-dependency.sh
RUN /auto_config/run.py -p /auto_config/playbook-mini.yml -a deploy


CMD ["/usr/bin/fish"]
