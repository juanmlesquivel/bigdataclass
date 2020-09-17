FROM openjdk:14-alpine

ENV SPARK_HOME=/usr/lib/python3.7/site-packages/pyspark

RUN apk add bash && \
  apk add build-base && \
  apk add nano && \
  apk add postgresql-client && \
  apk add python3 && \
  apk add python3-dev && \
  apk add libffi-dev && \
  apk add openblas-dev && \
  apk add zlib-dev && \
  apk add jpeg-dev && \
  pip3 install --upgrade pip setuptools wheel && \
  pip3 install numpy && \
  pip3 install matplotlib && \
  pip3 install seaborn && \
  pip3 install pyspark && \
  pip3 install pytest && \
  pip3 install notebook && \
  pip3 install findspark && \
  ln /usr/bin/python3.7 /usr/bin/python

WORKDIR /src

COPY . /src
