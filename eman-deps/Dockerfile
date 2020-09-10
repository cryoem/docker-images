FROM cryoem/eman-deps:py3-circleci18

RUN . $HOME/miniconda/etc/profile.d/conda.sh && \
    conda create -n eman eman-deps-dev=24.1 -c cryoem -c defaults -c conda-forge --yes && \
    conda clean --all --yes

ENV PYTHONUNBUFFERED 1

CMD [ "/bin/bash" ]
