#!/bin/bash
# Substitute install directory with your own
KAFKA_DIR="$HOME/kafka"

$KAFKA_DIR/bin/kafka-console-producer.sh --broker-list localhost:9092 --topic test
