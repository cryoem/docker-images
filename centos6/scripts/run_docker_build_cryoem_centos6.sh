#!/usr/bin/env bash

if [ $# -ne 1 ];then
    echo
    echo -e '\033[35m'"  Usage: $(basename ${0}) [workspace-root-dir]"'\033[0m'
    echo
    exit 1
fi

root_dir=$(cd $1; pwd -P)

sudo docker info

cat << EOF | sudo docker run -i \
                        -v "$root_dir":/workspace \
                        -a stdin -a stdout -a stderr \
                        cryoem/centos6:latest

conda build /workspace/eman2/recipes/eman -c cryoem -c defaults -c conda-forge

mkdir -p /workspace/centos6 && cd /workspace/centos6
constructor /workspace/build-scripts/constructor

EOF
