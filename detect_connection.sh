#!/bin/bash

PREV_STATE="/tmp/usb_state"
CURR_STATE=$(system_profiler SPUSBDataType)

if [ -f "$PREV_STATE" ]; then
    # if ! diff "$PREV_STATE" <(echo $CURR_STATE) >/dev/null; then
    # if ! diff "$PREV_STATE" <(echo $CURR_STATE) ; then
    if diff <(cat $PREV_STATE) <(echo "$CURR_STATE") | grep '^>' | grep -q "Product ID"; then
        osascript -e 'display notification "USB device connected" with title "Detection Notification"'
        open 'x-apple.systempreferences:com.apple.Displays-Settings.extension'
    fi
fi

echo "$CURR_STATE" > "$PREV_STATE"

