FROM polynote/polynote:latest
USER root

WORKDIR /usr/src/app

# Install pre-requisites needed for python dependencies
RUN apt-get update
RUN set -e; \
  apt-get install -y \ 
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
CMD bash polynote/polynote
