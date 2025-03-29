#!/bin/bash

SERVICE="nginx"
echo "Waiting for $SERVICE to strat....."

until systemctl is-active --quiet "$SERVICE"; do
    echo "$SERVICE is not running yet..."
    sleep 3
done

echo "$SERVICE is now running"
