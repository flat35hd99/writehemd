FROM codercom/code-server:latest

RUN apt-get update \
    && echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections \
    && apt-get install \
        python3 \
        python3-pip \
        msttcorefonts \
        ttf-mscorefonts-installer \
        texlive-fonts-recommended \
        texlive-lang-greek \
        texlive-latex-base \
        texlive-latex-recommended \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
