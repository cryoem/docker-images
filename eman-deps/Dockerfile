FROM cryoem/eman-deps:circleci18


RUN . $HOME/miniconda/etc/profile.d/conda.sh && \
    conda create -n eman-deps-16.0 eman-deps=16.0 cmake=3.14 -c cryoem -c defaults -c conda-forge --yes && \
    conda clean --all --yes

ENV PYTHONUNBUFFERED 1

CMD [ "/bin/bash" ]
