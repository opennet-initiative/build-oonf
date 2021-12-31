FROM debian:11
RUN apt-get update && apt-get install -y \
    git vim \
    cmake build-essential libnl-3-dev \
    devscripts

# use gcc9 because of compiling error with default installed gcc10
RUN apt install -y gcc-9 g++-9
# we need to keep gcc10 installed but use gcc9.
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 9
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-10 10
RUN update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-9 9
RUN update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-10 10
RUN update-alternatives --set gcc /usr/bin/gcc-9
RUN update-alternatives --set g++ /usr/bin/g++-9

RUN mkdir -p /oonf/mount
ADD build-oonf-in-container.sh /oonf/build-oonf-in-container.sh

WORKDIR /oonf
CMD ["bash","./build-oonf-in-container.sh"]
