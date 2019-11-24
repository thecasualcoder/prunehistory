FROM nimlang/nim

RUN apt-get install clang llvm-dev automake autogen libtool patch libxml2-dev uuid-dev libssl-dev make cmake zlib1g-dev --yes
RUN cd ~ && git clone https://github.com/tpoechtrager/osxcross.git && cd osxcross
COPY MacOSX10.15.sdk.tar.xz /root/osxcross/tarballs
RUN UNATTENDED="auto" /root/osxcross/build.sh
ENV PATH="/root/osxcross/target/bin:${PATH}"