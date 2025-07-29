#!/bin/bash

# Get the current brightness level for VGA-0
current_brightness=$(xrandr --verbose --current | grep -A5 "VGA-0" | grep Brightness | awk '{print $2}')

# Check if current_brightness is empty
if [ -z "$current_brightness" ]; then
    echo "Error: Could not retrieve current brightness for VGA-0"
    exit 1
fi

# Calculate new brightness (increase by 0.2)
new_brightness=$(echo "$current_brightness + 0.2" | bc)

# Apply new brightness level
xrandr --output VGA-0 --brightness $new_brightness

echo "Brightness increased to $new_brightness"
