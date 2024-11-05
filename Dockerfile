FROM debian:bookworm

RUN apt-get update && apt install -y zip wget curl golang build-essential \
    pkg-config libaio-dev libblkid-dev libkeyutils-dev \
    liblz4-dev libsodium-dev liburcu-dev libzstd-dev \
    uuid-dev zlib1g-dev valgrind libudev-dev udev git \
    python3 python3-docutils libclang-dev debhelper dh-python 

# install rust
RUN curl https://sh.rustup.rs -sSf | sh -s -- --default-toolchain nightly -y
ENV PATH="/root/.cargo/bin:${PATH}"

ENV SOURCE_DATE_EPOCH 1600000000

# build bcachefs-tools
RUN mkdir /src /bins && wget https://github.com/koverstreet/bcachefs-tools/archive/refs/tags/v1.13.0.zip && unzip -d /src /v1.13.0.zip && mv /src/bcachefs-tools-1.13.0/* /src
RUN cd /src && make -j$(nproc) && cp ./bcachefs /bins/bcachefs && make clean

# freeze bcachefs binary
RUN go run github.com/gokrazy/freeze/cmd/freeze@latest /bins/bcachefs 
