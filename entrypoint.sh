#!/bin/bash
service ssh start

echo "Container is ready. SSH is available on port 22."

exec /bin/bash
