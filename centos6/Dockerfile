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
               fontconfig \
               git && \
    yum clean all
