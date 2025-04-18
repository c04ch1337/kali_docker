#!/bin/bash

HOST="$1"
PORT="${2:-2222}"
USER="root"

echo "Setting up SSH tunnels to $HOST:$PORT..."

ssh -L 8080:localhost:8080 \
    -L 4444:localhost:4444 \
    -L 445:localhost:445 \
    -L 53:localhost:53 \
    -L 80:localhost:80 \
    -L 443:localhost:443 \
    -p "$PORT" "$USER@$HOST"
