#! /bin/bash
spark-submit \
  --driver-class-path spark-sql-kafka-0-10_2.12-3.0.0.jar,kafka-clients-2.6.0.jar \
  --jars spark-sql-kafka-0-10_2.12-3.0.0.jar,kafka-clients-2.6.0.jar \
  --packages org.apache.spark:spark-sql-kafka-0-10_2.12:3.0.0,org.apache.kafka:kafka-clients:2.6.0 \
  sparkstream.py
