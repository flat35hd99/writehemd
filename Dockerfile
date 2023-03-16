FROM codercom/code-server:latest

USER root

RUN apt-get update -y -qq \
    && echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections \
    && apt-get install -y -qq \
        python3 \
        python3-pip \
        texlive-fonts-recommended \
        texlive-lang-greek \
        texlive-latex-base \
        texlive-latex-recommended \
    && apt-get clean

User 1000
