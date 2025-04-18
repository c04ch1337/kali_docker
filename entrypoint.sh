#!/bin/bash
service ssh start
#service cron start

echo "Container is ready. SSH is available on port 22."

#echo "0 2 * * * root /root/shared/cron-daily-scan.sh" >> /etc/crontab
#echo "30 2 * * * root /root/shared/cron-daily-poc.sh" >> /etc/crontab


exec /bin/bash
