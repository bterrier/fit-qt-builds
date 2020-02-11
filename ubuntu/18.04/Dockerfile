FROM ubuntu:18.04
RUN apt-get update -q && apt-get install -y -q \
    build-essential gcc-8 g++-8 \
    bison flex gperf

RUN useradd -ms /bin/bash qt
USER qt
WORKDIR /home/qt

