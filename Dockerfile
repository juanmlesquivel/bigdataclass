FROM openjdk:14-alpine

ENV SPARK_HOME=/usr/lib/python3.7/site-packages/pyspark

RUN apk add bash
RUN apk add python3
RUN pip3 install --upgrade pip
RUN pip3 install pyspark

RUN ln /usr/bin/python3.7 /usr/bin/python

WORKDIR /src

COPY . /src
