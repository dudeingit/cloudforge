#!/bin/bash

set -e

NAMESPACE="cloudforge"
DEPLOYMENT="cloudforge-app"

echo "Checking deployment health..."

if ! kubectl rollout status deployment/$DEPLOYMENT -n $NAMESPACE --timeout=30s; then
    echo "Deployment unhealthy. Rolling back..."
    kubectl rollout undo deployment/$DEPLOYMENT -n $NAMESPACE
    kubectl rollout status deployment/$DEPLOYMENT -n $NAMESPACE --timeout=60s
    echo "Rollback completed successfully."
else
    echo "Deployment is healthy. No rollback required."
fi
