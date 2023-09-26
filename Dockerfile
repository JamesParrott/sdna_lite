ARG BASE_IMAGE=ubuntu
ARG BASE_TAG=jammy

FROM "${BASE_IMAGE}:${BASE_TAG}"

RUN apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    g++ \
    cmake \
    git \
    libboost-dev \
    ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    cd /src && \
    git clone https://github.com/JamesParrott/sdna_lite && \
    mkdir build_geos && \
    cd build_geos && \
    CXX=g++ cmake ../sdna_lite/sDNA/geos/drop && \
    make