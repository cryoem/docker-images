#!/usr/bin/env bash

if [ $# -ne 2 ];then
    echo
    echo -e '\033[35m'"  Usage: $(basename ${0}) [docker-image] [workspace-root-dir]"'\033[0m'
    echo
    exit 1
fi

set -exv
docker_image=$1
root_dir=$(cd $2; pwd -P)

scripts_root=$(cd $(dirname $0)/..; pwd -P)
echo ${scripts_root}
#exit

docker info

cat << EOF | docker run -i \
                        -v "$root_dir":/workspace \
                        -v "$scripts_root":/scripts_root \
                        -e scripts_root_dir="/scripts_root" \
                        -a stdin -a stdout -a stderr \
                        $docker_image \
                        bash

set -ex
export PYTHONUNBUFFERED=1
#export scripts_root_dir="/scripts_root"
#echo ${scripts_root_dir}

bash /scripts_root/scripts/dockerfile.sh
bash /scripts_root/scripts/build_and_package.sh /workspace/eman2 /workspace/centos6 /scripts_root/constructor

EOF
