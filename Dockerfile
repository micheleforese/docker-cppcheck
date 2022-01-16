FROM debian:11

LABEL mantainer="Michele Forese"
LABEL email="michele.forese.personal@gmail.com"
LABEL name="cppcheck"
LABEL version="0.1"

ENV DEBIAN_FRONTEND noninteractive

ARG SOURCE_BRANCH

# Install Fundamentals
RUN apt-get update \
  && apt-get install -y \
  git \
  make \
  g++ \
  python \
  libpcre3-dev

# Clear the apt list
RUN rm -rf /var/lib/apt/lists/*

# Create the directory
RUN mkdir -p /usr/src /src \
  && cd /usr/src

# Download CppCheck
RUN git clone https://github.com/danmar/cppcheck.git \
  && cd cppcheck \
  && git checkout tags/$SOURCE_BRANCH \
  && make install \
  MATCHCOMPILER=yes \
  FILESDIR=/usr/bin/ \
  HAVE_RULES=yes \
  CXXFLAGS="-O2 -DNDEBUG -Wall -Wno-sign-compare -Wno-unused-function"

# Clean for the source code
RUN rm -rf /usr/src

WORKDIR /src

VOLUME [ "/src" ]