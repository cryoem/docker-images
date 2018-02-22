FROM cryoem/centos6:working


RUN \
    rm -rf constructor-eman.tar.gz constructor-eman Miniconda2-latest-Linux-x86_64.sh && \
    curl -v -L https://github.com/cryoem/constructor/archive/eman/2.0.1.tar.gz -o constructor-eman.tar.gz && \
    tar xzvf constructor-eman.tar.gz && \
    cd constructor-eman-2.0.1/ && \
    conda remove constructor --yes && \
    conda install constructor --yes -q && \
    python setup.py install && \
    conda update ruamel_yaml --no-deps --yes -q && \
    conda install conda-build=2 --no-deps --yes -q

ENV PATH /root/miniconda2/bin:$PATH
ENV PYTHONUNBUFFERED 1

CMD [ "/bin/bash" ]
