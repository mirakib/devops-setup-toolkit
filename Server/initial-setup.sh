#!/bin/bash
# Usage: sudo bash initial-setup.sh <username>

if [ -z "$1" ]; then
  echo "Usage: $0 <username>"
  exit 1
fi

USERNAME="$1"

# Example Public Key (replace with your real one)
PUBLIC_KEY="ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMx3QmFzZTY0RW5jb2RlZFN0cmluZ0ZvckV4YW1wbGU= rakib@laptop"

# Create user
adduser --disabled-password --gecos "" "$USERNAME"
usermod -aG sudo "$USERNAME"

# Set up SSH
mkdir -p /home/"$USERNAME"/.ssh
echo "$PUBLIC_KEY" > /home/"$USERNAME"/.ssh/authorized_keys
chmod 700 /home/"$USERNAME"/.ssh
chmod 600 /home/"$USERNAME"/.ssh/authorized_keys
chown -R "$USERNAME":"$USERNAME" /home/"$USERNAME"/.ssh

# Configure firewall
ufw allow OpenSSH
ufw --force enable

echo "Setup complete! User: $USERNAME"
