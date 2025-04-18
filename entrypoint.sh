#!/bin/bash

# Start SSH
service ssh start

# Set root password (default: kali)
echo "root:${ROOT_PASS:-kali}" | chpasswd

# Make sure shared scripts are executable
chmod +x /root/shared/*.sh 2>/dev/null || true

# Set up initial working directory
mkdir -p /root/work

# Conditionally enable cron jobs
if [ "$ENABLE_CRON" == "true" ]; then
    echo "0 2 * * * root /root/shared/cron-daily-scan.sh" >> /etc/crontab
    echo "30 2 * * * root /root/shared/cron-daily-poc.sh" >> /etc/crontab
    service cron start
else
    echo "Cron jobs are disabled. Set ENABLE_CRON=true to enable."
fi

echo "Container is ready. Access via SSH or attach directly."

# Keep the container alive and interactive if needed
exec bash
