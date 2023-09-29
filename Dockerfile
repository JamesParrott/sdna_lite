ARG BASE_IMAGE=ubuntu
ARG BASE_TAG=jammy

# Geos builder stage.  https://libgeos.org/usage/download/
# sDNA has a statically linked copy of v 3.3.5 ( see sDNA/geos/drop/configure.in )

FROM "${BASE_IMAGE}:${BASE_TAG}" as geos_builder

ARG GEOS_SRC_DIR=/tmp/sdna_lite/sDNA/geos
ARG BINARIES_DIR=/tmp/build_geos
ARG ARCH=arm

RUN apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    g++ \
    make \
    cmake \
    libboost-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* 

WORKDIR /tmp

COPY sDNA/geos/drop ${GEOS_SRC_DIR}/${ARCH}

RUN mkdir -p "${BINARIES_DIR}" && \
    cd ${BINARIES_DIR} && \
    CXX=g++ cmake ${GEOS_SRC_DIR}/${ARCH} && \
    make



# sdna_lite compilation stage

FROM "${BASE_IMAGE}:${BASE_TAG}" as sdna_lite_builder

ARG INSTALL_DIR=/usr/bin/sdna_lite

RUN apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    g++ \
    make \
    cmake \
    libboost-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* 

WORKDIR ${INSTALL_DIR}

COPY . ${INSTALL_DIR}

COPY --from=geos_builder ${BINARIES_DIR}/${ARCH} ${INSTALL_DIR}/${ARCH}

