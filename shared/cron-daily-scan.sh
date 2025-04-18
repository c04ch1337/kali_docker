#!/bin/bash
# Daily scan example – run nmap against a default internal subnet

SCAN_TARGETS="192.168.1.0/24"
OUTPUT="/root/work/daily_nmap_scan_$(date +%F).txt"

nmap -sV -T4 $SCAN_TARGETS -oN "$OUTPUT"

EMAIL_TO="${EMAIL_TO:-security-team@example.com}"
echo "Daily Nmap Scan Report" | mail -s "Nmap Scan $(date)" -a "$OUTPUT" "$EMAIL_TO"
