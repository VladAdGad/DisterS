FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update &&\
    apt-get install --no-install-recommends --yes \
    gnupg2=2.2.19-3ubuntu2 \
    python3-pip=20.0.2-5ubuntu1.1 \
    rsync=3.1.3-8 \
    ssh=1:8.2p1-4ubuntu0.1 \
    wget=1.20.3-1ubuntu1

RUN pip3 install \
    ansible-lint==4.3.7 \
    molecule==3.2.2 \
    molecule-vagrant==0.6.1 \
    python-vagrant==0.5.15

RUN echo "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian eoan contrib" | tee /etc/apt/sources.list.d/virtualbox.list &&\
    wget --quiet https://www.virtualbox.org/download/oracle_vbox_2016.asc --output-document=- | apt-key add - &&\
    wget --quiet https://www.virtualbox.org/download/oracle_vbox.asc --output-document=- | apt-key add - &&\
    apt-get update &&\
    apt-get install --yes virtualbox-6.1

ARG vagrant_pkg=vagrant_2.2.14_x86_64.deb
RUN wget https://releases.hashicorp.com/vagrant/2.2.14/${vagrant_pkg} &&\
    dpkg --install ${vagrant_pkg} &&\
    rm ${vagrant_pkg}

#docker build --tag disters .
#docker run --privileged disters
