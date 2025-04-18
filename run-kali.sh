#!/bin/bash
docker-compose up -d --build
echo
echo "Kali container is up and running."
echo "Access via SSH:"
echo "ssh root@localhost -p 2222 (password: toor)"
echo
echo "Set up tunnels with: ./ssh-tunnel.sh <host-ip>"
