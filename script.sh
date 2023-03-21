#!/bin/bash -e
clefuser_ansible="ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBKTU4LbNRT7d441d9SA5yCzyUnSzveXs+aXUFgVcSN/TJ880HKoINpJGml1IoAIRbRIM5na8OUgNflPungvYHlY= user-ansible@ansible"
sudo mkdir /home/user-ansible
sudo mkdir /home/user-ansible/.ssh
sudo useradd -d /home/user-ansible -s /usr/bin/bash user-ansible
sudo chown user-ansible:user-ansible /home/user-ansible
sudo chown user-ansible:user-ansible /home/user-ansible/.ssh
sudo chmod 750 /home/user-ansible
echo "user-ansible ALL=(ALL:ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers.d/user-ansible
echo "${clefuser_ansible}" | sudo tee -a /home/user-ansible/.ssh/authorized_keys
sudo chown user-ansible:user-ansible /home/user-ansible/.ssh/authorized_keys
sudo chmod 600 /home/user-ansible/.ssh/authorized_keys
sudo apt update
sudo apt install python3 -y
sudo reboot
