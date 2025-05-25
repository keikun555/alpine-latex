FROM alpine:3.21

FROM alpine

# Install bibclean
RUN apk add --no-cache build-base
WORKDIR /tmp
RUN wget https://ftp.math.utah.edu/pub/bibclean/bibclean-3.07.tar.xz 
RUN tar -xf bibclean-3.07.tar.xz
WORKDIR /tmp/bibclean-3.07
RUN ./configure
RUN make all
RUN make install
RUN apk del build-base

RUN apk add --no-cache texlive-full
RUN apk add --no-cache biber

# For SVG images
RUN apk add --no-cache inkscape

# To make it easier to run commands in the container
RUN apk add --no-cache make

ENV PATH=$PATH:/usr/share/texmf-dist/scripts/latexindent

WORKDIR /data
