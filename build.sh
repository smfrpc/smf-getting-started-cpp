#!/bin/bash
set -ex
root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
buildcmd="ninja -C $root/build"
function release {
    echo "Release"
    cd $root
    $root/cooking.sh -r wellknown
    ln -sfn "${builddir}/compile_commands.json" "${root}/compile_commands.json"
    ${buildcmd}
}

if [[ ! -d $root/build ]]; then
   echo "Adding system dependencies"
   sudo install-deps.sh
fi
release
