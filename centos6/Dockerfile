FROM centos:6


# Set an encoding to make things work smoothly.
ENV LANG en_US.UTF-8

# Add a timestamp for the build. Also, bust the cache.
ADD http://tycho.usno.navy.mil/timer.html /opt/docker/etc/timestamp

# Install basic requirements.
RUN yum update -y && \
    yum install -y \
               mesa-libGLU-devel \
               gcc \
               gcc-c++ \
               libXext-devel \
               libXrender-devel \
               libSM-devel \
               libX11-devel && \
    yum clean all

RUN curl -v -L -O https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh && \
    bash Miniconda2-latest-Linux-x86_64.sh -b && \
    source $HOME/miniconda2/bin/activate root && \
    conda config --set show_channel_urls True && \
    conda update --all --yes && \
    conda install constructor conda-build --yes && \
    curl -v -L https://github.com/cryoem/constructor/archive/eman.tar.gz -o constructor-eman.tar.gz && \
    tar xzvf constructor-eman.tar.gz && \
    cd constructor-eman/ && \
    python setup.py install && \
    conda build /workspace/eman2/recipes/eman -c cryoem -c defaults -c conda-forge && \
    mkdir -p /workspace/centos6 && cd /workspace/centos6 && \
    constructor /workspace/build-scripts/constructor

CMD [ "/bin/bash" ]