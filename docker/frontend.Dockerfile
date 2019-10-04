FROM ubuntu:18.04 AS npm

ARG REACT_APP_API_LOC
ARG REACT_APP_COVERITY_LOC

RUN apt-get update && apt-get -y install \
    nano \
    curl \
    && rm -rf /var/lib/apt/lists/*

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -

RUN apt-get update && apt-get -y install \
  nodejs \
  && rm -rf /var/lib/apt/lists/*

RUN groupadd -g 459 dockeruser && \
    useradd -r -u 459 -g dockeruser -m dockeruser

USER dockeruser

RUN mkdir /home/dockeruser/app

WORKDIR /home/dockeruser/app

ENV NODE_ENV=${NODE_ENV}

COPY ./package.json /home/dockeruser/app

RUN npm install

COPY . /home/dockeruser/app

RUN npm run build

FROM httpd:2.4.39 AS apache

COPY --from=npm /home/dockeruser/app/build /usr/local/apache2/htdocs/
