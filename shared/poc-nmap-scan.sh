#!/bin/bash

# Sample PoC: Nmap scan on internal subnet
TARGET_SUBNET="192.168.1.0/24"
OUTPUT="nmap_scan_$(date +%F).txt"

nmap -sS -T4 -A $TARGET_SUBNET -oN /root/work/$OUTPUT

echo "Scan complete. Output saved to /root/work/$OUTPUT"
