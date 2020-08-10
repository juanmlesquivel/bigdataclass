#!/bin/bash
# Substitute install directory with your own
KAFKA_DIR="$HOME/kafka"

$KAFKA_DIR/bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic test --from-beginning
