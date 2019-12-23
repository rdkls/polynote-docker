FROM polynote/polynote:latest
USER root

# Install pre-requisites needed for python dependencies
RUN apt-get update
RUN set -e; \
  apt-get install -y \ 
    bash \
    gcc \
    g++ \
    libc-dev \
    linux-headers-amd64 \
    libmariadb-dev \
    libpython3-dev \
    libpng-dev \
    libxml2-dev \
    libxslt-dev \
    zlib1g-dev \
    libjpeg-dev \
  ;

# Install Python and dependencies
ENV PYTHONUNBUFFERED=1
COPY requirements.txt ./requirements.txt
RUN pip3 install -r requirements.txt

EXPOSE 8192

USER polly
COPY config.yml /opt/polynote
ENTRYPOINT /opt/polynote/polynote.py
