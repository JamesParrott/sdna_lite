ARG BASE_IMAGE=ubuntu
ARG BASE_TAG=jammy

FROM "${BASE_IMAGE}:${BASE_TAG}" as base_builder

RUN apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    g++ \
    make \
    cmake \
    libboost-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* 

# Geos builder stage.  https://libgeos.org/usage/download/

# Geos is a large library, that takes 5 minutes or so to compile,
# but doesn't change very often, if at all.  
# So lets use  a Docker multi stage build to cache its binaries!

# sDNA has a statically linked copy of Geos v3.3.5 ( see sDNA/geos/drop/configure.in )

# Geos can be installed from many package managers which makes sense to me. 
# Unfortunately, Ubuntu GIS has only compiled Geos for x86, and I'm testing 
# this on a free ARM virtual server (thanks Oracle Cloud!). 

FROM base_builder as geos_builder

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

FROM base_builder as sdna_lite_builder

ARG INSTALL_DIR=/usr/bin/sdna_lite

# RUN apt-get update -y && \
#     DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
#     g++ \
#     make \
#     cmake \
#     libboost-dev && \
#     apt-get clean && \
#     rm -rf /var/lib/apt/lists/* 

WORKDIR ${INSTALL_DIR}

COPY . ${INSTALL_DIR}

COPY --from=geos_builder ${BINARIES_DIR}/${ARCH} ${INSTALL_DIR}/${ARCH}

