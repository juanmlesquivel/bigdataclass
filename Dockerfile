FROM openjdk:14-alpine

ENV SPARK_HOME=/usr/lib/python3.7/site-packages/pyspark

RUN apk add bash
RUN apk add build-base
RUN apk add nano
RUN apk add postgresql-client
RUN apk add python3
RUN apk add python3-dev
RUN apk add libffi-dev
RUN apk add openblas-dev
RUN apk add zlib-dev
RUN apk add jpeg-dev
RUN apk add zeromq-dev
RUN pip3 install --upgrade pip setuptools wheel
RUN pip3 install numpy
RUN pip3 install matplotlib
RUN pip3 install seaborn
RUN pip3 install pyspark
RUN pip3 install pytest
RUN pip3 install notebook
RUN pip3 install findspark
RUN ln /usr/bin/python3.7 /usr/bin/python

WORKDIR /src

COPY . /src
