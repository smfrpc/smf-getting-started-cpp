#!/bin/bash
set -ex
root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
buildcmd="ninja"
function release {
    echo "Release"
    builddir=$root/build/release
    mkdir -p $builddir
    cd ${builddir}
    local travis=""
    if [[ "${TRAVIS}" == "1" ]]; then
        set -x
        echo "Travis build: reducing compilation to only -O1 for speed"
        travis=(-DCMAKE_CXX_FLAGS_RELEASE="-O1 -DNDEBUG"
                -DSMF_ENABLE_BENCHMARK_TESTS=OFF)
    else
        travis=(-DSMF_ENABLE_BENCHMARK_TESTS=ON
                -DSEASTAR_ENABLE_DPDK=ON)
    fi
    cmake     -Wno-dev \
              -DCMAKE_VERBOSE_MAKEFILE=ON \
              -GNinja \
              -DCMAKE_INSTALL_PREFIX=${builddir} \
              -DSMF_ENABLE_CMAKE_PROJECT_FLAGS=ON \
              -DCMAKE_BUILD_TYPE=Release \
              "${travis}" ${root}

    # for fmt.py
    ln -sfn "${builddir}/compile_commands.json" "${root}/compile_commands.json"
    ${buildcmd}
}

if [[ ! -d $root/build ]]; then
   # the following is only needed once; prevents github issue tickets
   git submodule update --init --recursive
   smfdir=$root/src/third_party/smf
   echo "Adding system dependencies"
   sudo $smfdir/install-deps.sh
   sudo $smfdir/src/third_party/seastar/install-dependencies.sh
fi
release
