#!/bin/bash

# Input validation
if [ -z "$1" ]; then
  echo "Please provide a valid number of minutes or 'stop'."
  exit 1
fi

# Pomodoro timer status file and PID file
BASHODORO_STATUS_FILE="$HOME/.bashodoro_status"
BASHODORO_PID_FILE="$HOME/.bashodoro_pid"

if [ "$1" == "stop" ]; then
  if [ -f "$BASHODORO_PID_FILE" ]; then
    existing_pid=$(cat "$BASHODORO_PID_FILE")
    kill "$existing_pid"
    rm "$BASHODORO_PID_FILE"
    echo "--:--" > "$BASHODORO_STATUS_FILE"
    echo "Pomodoro timer stopped."
  else
    echo "No Pomodoro timer is currently running."
  fi
  exit 0
fi

if ! [[ "$1" =~ ^[0-9]+$ ]]; then
  echo "Please provide a valid number of minutes."
  exit 1
fi

minutes=$1
seconds=$((minutes * 60))

# Check if another Pomodoro timer is running and exit if so
if [ -f "$BASHODORO_PID_FILE" ]; then
  existing_pid=$(cat "$BASHODORO_PID_FILE")
  if kill "$existing_pid"; then
    echo "Another Pomodoro timer is already running. Exiting."
    exit 2
  else
    rm "$BASHODORO_PID_FILE"
  fi
fi

# Save the current script's PID
echo $$ > "$BASHODORO_PID_FILE"

# Countdown function
countdown() {
  local time_left=$1
  while [ $time_left -gt 0 ]; do
    clear
    echo "Time left: $(printf "%02d" $((time_left / 60))):$(printf "%02d" $((time_left % 60)))"
    echo ""
    echo "🍅 Stay focused and calm. Don't be distracted."
    echo "$(printf "%02d" $((time_left / 60))):$(printf "%02d" $((time_left % 60)))" > "$BASHODORO_STATUS_FILE"
    sleep 1
    time_left=$((time_left - 1))
  done
  rm "$BASHODORO_STATUS_FILE"
}

# Pomodoro timer
countdown $seconds

# macOS notification
terminal-notifier -message "Time's up! Take a break." -title "Pomodoro Timer" -sound default -ignoreDnD 

# Animation function
animate_completion() {
  local animation=("🍅" "🎉" "💥" "🎊")
  for i in {1..10}; do
    for emoji in "${animation[@]}"; do
      echo -n -e "\r$emoji"
      echo "$emoji" > "$BASHODORO_STATUS_FILE"
      read -t 1 -n 1 && break 2
    done
  done
  echo -n -e "\r--:--"
  echo "--:--" > "$BASHODORO_STATUS_FILE"
}

# Animate completion
animate_completion

# Remove the PID file
rm "$BASHODORO_PID_FILE"
