#!/bin/bash
# Substitute install directory with your own
KAFKA_DIR="$HOME/kafka"

$KAFKA_DIR/bin/kafka-topics.sh --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 1 --topic test

$KAFKA_DIR/bin/kafka-topics.sh --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 1 --topic prod

$KAFKA_DIR/bin/kafka-topics.sh --list --bootstrap-server localhost:9092
