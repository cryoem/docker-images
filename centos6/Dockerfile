FROM centos:6


# Set an encoding to make things work smoothly.
ENV LANG en_US.UTF-8

# Install basic requirements.
RUN yum update -y && \
    yum install -y \
               mesa-libGLU-devel \
               gcc \
               gcc-c++ \
               gcc-gfortran \
               fontconfig \
               libXext-devel \
               libXrender-devel \
               libSM-devel \
               libX11-devel \
               fontconfig && \
    yum clean all

RUN curl -v -L -O https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh && \
    bash Miniconda2-latest-Linux-x86_64.sh -b && \
    source $HOME/miniconda2/bin/activate root && \
    conda config --set show_channel_urls True && \
    conda update --all --yes && \
    conda install constructor conda-build --yes && \
    conda install cmake=3.8 -c conda-forge --yes && \
    curl -v -L https://github.com/cryoem/constructor/archive/eman.tar.gz -o constructor-eman.tar.gz && \
    tar xzvf constructor-eman.tar.gz && \
    cd constructor-eman/ && \
    python setup.py install

ENV PATH /root/miniconda2/bin:$PATH
ENV PYTHONUNBUFFERED 1

CMD [ "/bin/bash" ]
