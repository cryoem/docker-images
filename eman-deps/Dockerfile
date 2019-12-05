FROM circleci/buildpack-deps:18.04


RUN sudo apt-get update -y && \
    sudo apt-get upgrade -y && \
    sudo apt-get install freeglut3-dev \
        libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6 && \
    sudo apt-get autoremove -y && \
    sudo apt-get clean -y
    
RUN cd $HOME && curl -v -L https://repo.continuum.io/miniconda/Miniconda3-4.6.14-Linux-x86_64.sh -o miniconda.sh && \
    bash miniconda.sh -bp $HOME/miniconda && \
    rm miniconda.sh && \
    . $HOME/miniconda/etc/profile.d/conda.sh && \
    conda init && \
    conda config --set show_channel_urls True && \
    conda config --set auto_update_conda False && \
    conda install conda=4.6.14 conda-build=3.17.8 -c defaults --yes && \
    conda clean --all --yes

ENV PYTHONUNBUFFERED 1

CMD [ "/bin/bash" ]
