#!/bin/bash

PROCESS_NAME="test"
STATE_FILE="/var/run/test_monitor.pid"
LOG_FILE="/var/log/monitoring.log"
URL="https://test.com/monitoring/test/api"
PID=$(pgrep -x "$PROCESS_NAME")

if [ -z "$PID" ]; then
    exit 0
fi

if [ -f "$STATE_FILE" ]; then
    OLD_PID=$(cat "$STATE_FILE")
    if [ "$OLD_PID" != "$PID" ]; then
        echo "$(date '+%F %T') - процесс $PROCESS_NAME перезапущен" >> "$LOG_FILE"
    fi
fi

echo "$PID" > "$STATE_FILE"

curl -sSf "$URL" >/dev/null 2>&1

if [ $? -ne 0 ]; then
    echo "$(date '+%F %T') - сервер мониторинга недоступен" >> "$LOG_FILE"
fi

