#!/bin/bash
# Quick Nikto web vulnerability scan

TARGET="$1"
if [ -z "$TARGET" ]; then
    echo "Usage: $0 <target-url>"
    exit 1
fi

nikto -h "$TARGET" -o /root/work/nikto_$(echo $TARGET | sed 's/[^a-zA-Z0-9]/_/g').txt
echo "Nikto scan complete. Output saved to /root/work/"
