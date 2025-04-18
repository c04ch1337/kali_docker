#!/bin/bash
# Run selected PoCs daily (could be any subset)

TARGET="192.168.1.10"
EMAIL_TO="${EMAIL_TO:-security-team@example.com}"

/root/shared/poc-ms17-010-check.sh "$TARGET"
/root/shared/poc-cve-checker.sh "$TARGET"
/root/shared/poc-web-vuln-scan.sh "http://$TARGET"

tar czf /root/work/daily_poc_results_$(date +%F).tar.gz /root/work/*$TARGET*

echo "PoC Result Bundle" | mail -s "PoC Results $(date)" -a "/root/work/daily_poc_results_$(date +%F).tar.gz" "$EMAIL_TO"
