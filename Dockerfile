ARG img_ver=11
FROM debian:${img_ver}
RUN DEBIAN_FRONTEND=noninteractive apt-get \
    -o DPkg::options::="--force-confdef" \
    -o DPkg::options::="--force-confold" \
    update -y && \
  DEBIAN_FRONTEND=noninteractive apt-get \
      -o DPkg::options::="--force-confdef" \
      -o DPkg::options::="--force-confold" \
      install --no-install-recommends -y \
      qtbase5-dev qt3d5-dev qt5-qmake libqt5opengl5-dev libxi-dev libxrandr-dev libharfbuzz-dev \
      gcc build-essential bash
      # bash git curl ca-certificates qt5-qmake libharfbuzz-dev gcc build-essential
# Can't use curl because we need submodules too
# RUN curl -fsSL https://github.com/ahrm/sioyek/archive/${commit}.tar.gz | \
#     tar zxvf -
COPY . /src
WORKDIR /src
RUN ./build_linux.sh
