#!/bin/bash

# Pomodoro timer status file
BASHODORO_STATUS_FILE="$HOME/.bashodoro_status"
BASHODORO_SCRIPT_PATH="$HOME/bin/bashodoro.sh"

# Check if the Pomodoro status file exists
if [ -f "$BASHODORO_STATUS_FILE" ]; then
  # Read the remaining time
  remaining_time=$(cat "$BASHODORO_STATUS_FILE")
  echo "🍅 $remaining_time"
else
  echo "🍅 --:--"
fi

echo "---"
echo "Start 5 min | bash='$BASHODORO_SCRIPT_PATH' param1='5' terminal=false refresh=true"
echo "Start 15 min | bash='$BASHODORO_SCRIPT_PATH' param1='15' terminal=false refresh=true"
echo "Start 25 min | bash='$BASHODORO_SCRIPT_PATH' param1='25' terminal=false refresh=true"
echo "Stop | bash='$BASHODORO_SCRIPT_PATH' param1='stop' terminal=false refresh=true"
