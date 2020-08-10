#!/bin/bash
# Substitute install directory with your own
KAFKA_DIR="$HOME/kafka"

$KAFKA_DIR/bin/kafka-server-start.sh $KAFKA_DIR/config/server.properties
