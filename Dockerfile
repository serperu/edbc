FROM ubuntu:20.04

ENV DEBIAN_FRONTEND="noninteractive" TZ="Europe/London"
RUN apt-get update
RUN export PATH=$HOME/.local/bin:$PATH
RUN apt-get install -y build-essential erlang git vim


# # # INSTALL EDBC
RUN git clone https://github.com/serperu/edbc.git

WORKDIR "/edbc"

RUN make
