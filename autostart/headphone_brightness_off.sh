#!/usr/bin/env bash

# You can view all audio sinks by `pactl list short sinks`
# The current sink can be obtained with this command `pactl info | grep "Default Sink"`


while true; do
  LAST_BATTERY_LEVEL="$BATTERY_LEVEL"
  BATTERY_LEVEL=$(headsetcontrol -cb 2>/dev/null)

  if [ -z "$LAST_BATTERY_LEVEL" ] && [ -n "$BATTERY_LEVEL" ]; then
    # Headset connected
    headsetcontrol -cl0
  fi
  sleep 2
done
