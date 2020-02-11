FROM cryoem/eman-deps:circleci18


RUN . $HOME/miniconda/etc/profile.d/conda.sh && \
    conda create -n eman eman-deps-dev=19.0 -c cryoem -c defaults -c conda-forge --yes && \
    conda clean --all --yes

ENV PYTHONUNBUFFERED 1

CMD [ "/bin/bash" ]
