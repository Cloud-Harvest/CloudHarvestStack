#!/bin/bash

# Set the default number of task nodes if not already set.
TASK_NODES=${TASK_NODES:-6}

echo "Beginning redis tasks cluster configuration with ${TASK_NODES} task nodes.";

# First we need to check if there is an existing redis cluster configuration.
# If the cluster is already configured, we will purge the configuration and start fresh.
if redis-cli -h cloudharveststack-redis-node-1 --pass ${REDIS_PASSWORD} cluster info | grep -q "cluster_state:ok"; then
  echo "WARN: Redis cluster is already configured. Removing the existing configuration.";
  redis-cli -h cloudharveststack-redis-node-1 --pass ${REDIS_PASSWORD} cluster reset;
fi

# Check if the total number of task nodes is an even or odd number.
if (( TASK_NODES % 2 != 0 )); then
  echo "WARN: Total number of task nodes is odd (${TASK_NODES}). The last task node will not have a reader node.";
fi

# Build node list
NODE_LIST=""
for i in $(seq 1 ${TASK_NODES}); do
  NODE_LIST="${NODE_LIST} cloudharveststack-redis-node-${i}:6379"
done

# Create cluster in one step
echo "Creating cluster with nodes:${NODE_LIST}"
yes yes | redis-cli --cluster create ${NODE_LIST} --cluster-replicas 1 --pass ${REDIS_PASSWORD}
if [ $? -ne 0 ]; then
  echo "Failed to create the cluster."
  exit 1
fi

echo "Redis tasks cluster configuration completed successfully.";
