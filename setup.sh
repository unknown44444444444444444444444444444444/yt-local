#!/bin/bash
set -e

echo "=== YouTube Local - Setup ==="
read -p "Username: " USERNAME
read -s -p "Password: " PASSWORD
echo ""

SALT=$(openssl rand -base64 6 | tr -dc 'a-zA-Z0-9' | head -c 8)
HASH=$(openssl passwd -apr1 -salt "$SALT" "$PASSWORD")
echo "${USERNAME}:${HASH}" > ./nginx/.htpasswd

echo "✓ Created nginx/.htpasswd"
echo "Run: docker-compose up -d"
