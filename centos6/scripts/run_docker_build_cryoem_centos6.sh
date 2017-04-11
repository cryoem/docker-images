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

bash build_and_package.sh /workspace/eman2 /workspace/centos6 /workspace/build-scripts/constructor

EOF
