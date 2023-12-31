ARG BASE_IMAGE=ubuntu
ARG BASE_TAG=jammy
ARG GEOS_SRC_DIR=/tmp/sdna_lite/sDNA/geos
ARG GEOS_BIN_DIR=/tmp/build_geos
ARG ARCH=arm

ARG SDNA_SRC_DIR=/tmp/sdna_lite
ARG SDNA_BIN_DIR=/tmp/build_sdna

ARG INSTALL_DIR=/usr/bin/sdna_lite

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

ARG GEOS_SRC_DIR
ARG GEOS_BIN_DIR
ARG ARCH

WORKDIR ${GEOS_BIN_DIR}/${ARCH}

COPY sDNA/geos/drop ${GEOS_SRC_DIR}/${ARCH}

RUN CXX=g++ cmake ${GEOS_SRC_DIR}/${ARCH} && \
    make



# sdna_lite compilation stage

FROM base_builder as sdna_lite_builder

ARG GEOS_BIN_DIR
ARG ARCH
ARG INSTALL_DIR
ARG SDNA_SRC_DIR
ARG SDNA_BIN_DIR


WORKDIR ${SDNA_SRC_DIR}

COPY . ${SDNA_SRC_DIR}

RUN rm -rf ${SDNA_SRC_DIR}/sDNA/geos
RUN rm -rf ${SDNA_SRC_DIR}/sDNA/sdnacomwrapper

COPY --from=geos_builder ${GEOS_BIN_DIR}/${ARCH} ${SDNA_SRC_DIR}/output/${ARCH}

RUN mkdir -p ${SDNA_BIN_DIR}

# Warning!  This does a lot of stuff, takes a very long time, and produces 
# a lot of errors, but does produce a lib_sDNA_ubuntu.so
# RUN g++ -shared -o lib_sDNA_ubuntu.so -fPIC sDNA/sdna_vs2008/*.cpp sDNA/sdna_vs2008/*.h sDNA/sdna_vs2008/IteratorTypeErasure/any_iterator/any_iterator.hpp sDNA/muparser/drop/src/*.cpp  sDNA/muparser/drop/include/*.h

