FROM debian:stable
RUN groupadd -g 61000 tarutaru
RUN useradd -g 61000 -l -m -s /bin/false -u 61000 tarutaru

WORKDIR /home/tarutaru/workspace
RUN apt update -y && apt upgrade -y

# tools
RUN apt install -y git 
RUN apt install -y sudo
COPY sudoers /etc/sudoers
RUN service sudo restart
USER tarutaru
USER root
RUN apt install -y curl
RUN apt install -y vim
RUN apt install -y expect
RUN curl --remote-name https://prerelease.keybase.io/keybase_amd64.deb
# RUN apt install -y ./keybase_amd64.deb

# program language
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
RUN apt install -y nodejs

# nodejs
RUN npm install -g yarn
RUN npm install -g n
RUN n stable


# final

## change user
USER tarutaru