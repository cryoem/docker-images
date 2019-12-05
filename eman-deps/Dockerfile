FROM circleci/buildpack-deps:18.04


RUN sudo apt-get update -y && \
    sudo apt-get upgrade -y && \
    sudo apt-get install freeglut3-dev \
        libgl1-mesa-glx libegl1-mesa libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6 && \
    sudo apt-get autoremove -y && \
    sudo apt-get clean -y

CMD [ "/bin/bash" ]
