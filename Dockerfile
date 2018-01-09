FROM ruby:alpine

WORKDIR /dashboard

ENV GEM_HOME /dashboard/.bundle
ENV BUNDLE_PATH="$GEM_HOME" \
    BUNDLE_BIN="$GEM_HOME/bin" \
    BUNDLE_APP_CONFIG="$GEM_HOME"
ENV PATH $BUNDLE_BIN:$PATH

RUN apk add --no-cache git openssh-client curl unzip bash nano sudo ttf-dejavu coreutils

RUN git clone https://github.com/RakiP/DSH-Smashing.git

RUN echo "@testing http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
  && apk add --update \
              musl \
              build-base \
              linux-headers \
              ca-certificates \
              python3 \
              python3-dev \
  && pip3 install --no-cache-dir --upgrade --force-reinstall pip \
  && rm /var/cache/apk/*

RUN cd /usr/bin \
  && ln -sf easy_install-3.5 easy_install \
  && ln -sf idle3.5 idle \
  && ln -sf pydoc3.5 pydoc \
  && ln -sf python3.5 python \
  && ln -sf python3.5-config python-config \
  && ln -sf pip3.5 pip


RUN apk update && apk add make gcc g++ nodejs

RUN gem install smashing bundler

#Expose ports
EXPOSE 22
EXPOSE 5000

ADD py DSH-Smashing
RUN pip3 install -r DSH-Smashing/requirements.txt