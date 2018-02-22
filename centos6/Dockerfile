FROM cryoem/centos6:base


RUN curl -v -L https://repo.continuum.io/miniconda/Miniconda2-4.3.21-Linux-x86_64.sh -o miniconda.sh && \
    bash miniconda.sh -bp $HOME/miniconda && \
    rm miniconda.sh && \
    source $HOME/miniconda/bin/activate root && \
    conda config --set show_channel_urls True && \
    conda install constructor conda-build=2 --yes -q && \
    conda install cmake=3.9 -c defaults --yes -q && \
    conda install conda=4.3 conda-build=2 -c defaults --yes -q && \ 
    curl -v -L https://github.com/cryoem/constructor/archive/eman/2.0.1.tar.gz -o constructor-eman.tar.gz && \
    tar xzvf constructor-eman.tar.gz && \
    cd constructor-eman-2.0.1/ && \
    python setup.py install && \
    constructor --version && \
    cd .. && \
    rm -rf constructor-eman.tar.gz constructor-eman*/ && \
    conda clean --all --yes

ENV PATH /root/miniconda/bin:$PATH
ENV PYTHONUNBUFFERED 1

CMD [ "/bin/bash" ]
