FROM codercom/code-server:ubuntu

USER root

ENV DEBIAN_FRONTEND=noninteractive
ENV PATH="$PATH:/home/coder/.local/bin"
RUN apt-get update -y -qq \
    && echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections \
    && apt-get install -y -qq \
        python3 \
        python3-pip \
        texlive-fonts-recommended \
        texlive-lang-greek \
        texlive-latex-extra \
        texlive-latex-base \
        texlive-latex-recommended \
    && curl -o pandoc.deb -OL https://github.com/jgm/pandoc/releases/download/2.17.0.1/pandoc-2.17.0.1-1-amd64.deb \
    && dpkg -i pandoc.deb \
    && curl -o pandoc-crossref.tar.xz -OL https://github.com/lierdakil/pandoc-crossref/releases/download/v0.3.12.2/pandoc-crossref-Linux.tar.xz \
    && tar -xvf pandoc-crossref.tar.xz \
    && mv pandoc-crossref /bin \
    && rm -rf pandoc* \
    && apt-get clean

USER 1000
ENV USER=coder
WORKDIR /home/coder

# Add trusted SSH key fingerprints
COPY --chown=coder:coder ./known_hosts /home/coder/.ssh/known_hosts
RUN mkdir -p /home/coder/.local/bin/ \
    && ln -s /usr/bin/python3 /home/coder/.local/bin/python
