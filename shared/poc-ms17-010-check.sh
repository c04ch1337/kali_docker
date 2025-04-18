#!/bin/bash
# MS17-010 (EternalBlue) SMB Vulnerability Checker

TARGET="$1"
if [ -z "$TARGET" ]; then
    echo "Usage: $0 <target-ip>"
    exit 1
fi

nmap --script smb-vuln-ms17-010 -p 445 $TARGET -oN /root/work/ms17-010_$TARGET.txt
echo "Results saved to /root/work/ms17-010_$TARGET.txt"
