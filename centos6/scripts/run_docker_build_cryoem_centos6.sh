#!/usr/bin/env bash

if [ $# -ne 1 ];then
    echo
    echo -e '\033[35m'"  Usage: $(basename ${0}) [workspace-root-dir]"'\033[0m'
    echo
    exit 1
fi

root_dir=$(cd $1; pwd -P)

docker info

HOST_UID=$(id -u)
HOST_GID=$(id -g)

cat << EOF | docker run -i \
                        -v "$root_dir":/workspace \
                        -v "$root_dir"/docker_volumes/dot_conda:/root/.conda/ \
                        -v "$root_dir"/docker_volumes/conda_dir/conda-bld:/root/miniconda2/conda-bld \
                        -v "$root_dir"/docker_volumes/conda_dir/pkgs:/root/miniconda2/pkgs \
                        -a stdin -a stdout -a stderr \
                        cryoem/centos6:latest

bash /workspace/docker-images/centos6/scripts/build_and_package.sh /workspace/eman2 /workspace/centos6 /workspace/build-scripts/constructor

chown -v $HOST_GID:$HOST_UID /workspace/centos6/*

EOF
