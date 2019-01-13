#!/bin/bash
set -ex
root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
buildcmd="ninja -C $root/build"
cd $root
function release {
    echo "Release"
    $root/cooking.sh -r wellknown -t Release
    ln -sfn "${builddir}/compile_commands.json" "${root}/compile_commands.json"
    ${buildcmd}
}

if [[ ! -d $root/build ]]; then
   echo "Adding system dependencies"
   sudo $root/install-deps.sh
fi
release
