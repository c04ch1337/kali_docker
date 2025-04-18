#!/bin/bash
# SMTP outbound test from Kali

TO_EMAIL="$1"
if [ -z "$TO_EMAIL" ]; then
    echo "Usage: $0 <recipient-email>"
    exit 1
fi

echo "SMTP test from Kali Lab" | mail -s "SMTP Test $(date)" "$TO_EMAIL"

echo "If SMTP is configured correctly, the email should arrive at $TO_EMAIL"
