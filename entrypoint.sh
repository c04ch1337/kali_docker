#!/bin/bash
service ssh start

echo "Container is ready. SSH is available on port 22."

# Conditionally enable cron jobs
if [ "$ENABLE_CRON" == "true" ]; then
    echo "0 2 * * * root /root/shared/cron-daily-scan.sh" >> /etc/crontab
    echo "30 2 * * * root /root/shared/cron-daily-poc.sh" >> /etc/crontab
    service cron start
else
    echo "Cron jobs are disabled. Set ENABLE_CRON=true to enable."
fi

exec /bin/bash
