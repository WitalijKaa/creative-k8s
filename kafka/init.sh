#!/bin/sh
set -eu

KAFKA_DIR="/var/lib/kafka/data"
CONFIG="${1:?CMD with path to server.properties file required in compose}"

if [ ! -f "$KAFKA_DIR/meta.properties" ]; then
  /opt/kafka/bin/kafka-storage.sh format -t "$KAFKA_CLUSTER_ID" -c "$CONFIG"
fi

exec /opt/kafka/bin/kafka-server-start.sh "$CONFIG"
