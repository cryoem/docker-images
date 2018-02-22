FROM cryoem/centos6:base


RUN curl -v -L -O https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh && \
    bash Miniconda2-latest-Linux-x86_64.sh -b && \
    source $HOME/miniconda2/bin/activate root && \
    conda config --set show_channel_urls True && \
    conda update --all --yes && \
    conda install constructor conda-build --yes && \
    curl -v -L https://github.com/cryoem/constructor/archive/eman.tar.gz -o constructor-eman.tar.gz && \
    tar xzvf constructor-eman.tar.gz && \
    cd constructor-eman/ && \
    python setup.py install

ENV PATH /root/miniconda2/bin:$PATH
ENV PYTHONUNBUFFERED 1

CMD [ "/bin/bash" ]
