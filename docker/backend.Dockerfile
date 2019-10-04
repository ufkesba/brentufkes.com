FROM httpd:2.4.39 AS apache

RUN apt-get update && apt-get -y install \
    bash \
    curl \
    nano \
    python3-pip \
    wget \
    fontconfig \
    dos2unix \
    && rm -rf /var/lib/apt/lists/*

RUN groupadd -g 459 dockeruser && \
    useradd -r -u 459 -g dockeruser -m dockeruser

RUN mkdir tmp \
    && wget -O tmp/mod_wsgi.tar.gz https://github.com/GrahamDumpleton/mod_wsgi/archive/4.6.5.tar.gz \
    && tar xvfz tmp/mod_wsgi.tar.gz -C tmp \
    && cd tmp/mod_wsgi-4.6.5 \
    && ./configure --with-python=/usr/bin/python3.7 \
    && make \
    && make install \
    && cd ../.. \
    && rm -r tmp

RUN mkdir /home/dockeruser/app

WORKDIR /home/dockeruser/app

RUN pip3 install virtualenv

ENV PATH="$PATH:/home/dockeruser/.local/bin"

COPY ./src/requirements.txt /home/dockeruser/app

RUN pip3 install -r requirements.txt

COPY ./src /home/dockeruser/app

COPY ./apache/httpd.conf /usr/local/apache2/conf/httpd.conf

COPY ./apache/app.wsgi /var/www/app/app.wsgi
