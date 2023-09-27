ARG BASE_IMAGE=ubuntu
ARG BASE_TAG=jammy

FROM "${BASE_IMAGE}:${BASE_TAG}"

RUN apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    g++ \
    make \
    cmake \
    libboost-dev \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* 

WORKDIR /tmp

COPY sDNA/geos/drop /tmp/sdna_lite/sDNA/geos/drop

RUN mkdir -p /tmp/build_geos && \
    cd /tmp/build_geos && \
    CXX=g++ cmake ../sdna_lite/sDNA/geos/drop && \
    make
