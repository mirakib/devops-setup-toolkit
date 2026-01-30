#!/bin/bash
# Save as: initial-setup.sh

USERNAME="sammy"  # Change this
PUBLIC_KEY="ssh-rsa AAAAB3NzaC1yc2E..."  # Your public key

# Create user
adduser --disabled-password --gecos "" $USERNAME
usermod -aG sudo $USERNAME

# Set up SSH
mkdir -p /home/$USERNAME/.ssh
echo "$PUBLIC_KEY" > /home/$USERNAME/.ssh/authorized_keys
chmod 700 /home/$USERNAME/.ssh
chmod 600 /home/$USERNAME/.ssh/authorized_keys
chown -R $USERNAME:$USERNAME /home/$USERNAME/.ssh

# Configure firewall
ufw allow OpenSSH
ufw --force enable

echo "Setup complete! User: $USERNAME"
