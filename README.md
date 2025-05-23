# Kali Security Container (Internal Team Edition)

A Dockerized Kali Linux environment for internal security teams to perform supplemental vulnerability scanning, PoCs, and remote access through secure SSH tunnels.

## 🚀 Getting Started

```bash
./run-kali.sh
```

## 🔐 SSH Access

```bash
ssh root@<host-ip> -p 2222
# default password: toor
```

## 🔄 SSH Tunnels

```bash
./ssh-tunnel.sh <host-ip>
```

This script maps:
- 8080: Web tools
- 4444: Reverse shells (Metasploit)
- 445: SMB
- 53: DNS
- 80, 443: HTTP/S services

## 📂 Shared Volume

Everything in `shared/` is shared between host and container:
```bash
cd shared
```

## 📤 SMTP Output (for scan reports)

Set these in a `.env` file:
```
SMTP_SERVER=smtp.yourdomain.com
SMTP_USER=security@yourdomain.com
SMTP_PASS=yourpassword
```

## 🐳 Example Docker Run Command

docker run -d \
  -e ROOT_PASS='supersecure' \
  -e ENABLE_CRON=true \
  -p 2222:22 \
  -v kali-work:/root/work \
  -v $(pwd)/shared:/root/shared \
  --name kali-sec \
  kali-sec

  ## ✅ CRON Job Usage

To enable the cron jobs when running the container:
```
docker run -d -e ENABLE_CRON=true -p 2222:22 -v kali-work:/root/work kali-sec
```
