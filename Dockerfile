FROM codercom/code-server:latest

USER root

RUN apt-get update \
    && echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections \
    && apt-get install \
        python3 \
        python3-pip \
        texlive-fonts-recommended \
        texlive-lang-greek \
        texlive-latex-base \
        texlive-latex-recommended \
    && apt-get clean
