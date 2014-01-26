#!/bin/bash

set -e

# ---------------- User setup ----------------------#

echo "creating admin group"
groupadd -r admin

echo "adding vagrant to admin group"
usermod -a -G admin vagrant

echo "backing up sudoers file"
cp /etc/sudoers /etc/sudoers.orig

echo "setting up vagrant sudo settings"
sed -i -e '/Defaults\s\+env_reset/a Defaults\texempt_group=admin' /etc/sudoers
sed -i -e 's/%admin ALL=(ALL) ALL/%admin ALL=NOPASSWD:ALL/g' /etc/sudoers

# --------------- SSH KEYS ---------------------- #

echo "making .ssh directory"
mkdir ~/.ssh

echo "changing the permissions on .ssh"
chmod 700 ~/.ssh

echo "getting the vagrant public key and setting up authorized_keys"
cd ~/.ssh
wget --no-check-certificate 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub' -O authorized_keys

echo "changing the permissions and owner of the authorized_keys file"
chmod 600 ~/.ssh/authorized_keys
chown -R vagrant ~/.ssh

# ---------------- Update VM to latest  ------------------#
echo "updating the apt repositories"
sudo apt-get update -y -qq > /dev/null

echo "upgrading packages"
sudo apt-get upgrade -y -qq > /dev/null

# ------------------ package installation ----------------------#
echo "installing packages for the guest additions"
sudo apt-get install -y -qq dkms build-essential linux-headers-generic

reboot
sleep 30
