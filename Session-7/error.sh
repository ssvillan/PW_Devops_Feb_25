#!/bin/bash

LOG_FILE="/var/log/syslog"
KEYWORD="ERROR"

echo "Waiting for log file: $LOG_FILE..."
until [ -f "$LOG_FILE" ]; do
    echo "Log file not found, waiting..."
    sleep 3
done
echo "Log file detected!"


echo "Monitoring log file for '$KEYWORD'..."
tail -Fn0 "$LOG_FILE" | while read line; do
    if [[ "$line" =~ $KEYWORD ]]; then
        echo "⚠️ALERT: Error detected in logs!"
        echo "Log Entry: $line"
    fi
done
