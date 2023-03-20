#!/bin/bash -e
clefAnsible="ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBKTU4LbNRT7d441d9SA5yCzyUnSzveXs+aXUFgVcSN/TJ880HKoINpJGml1IoAIRbRIM5na8OUgNflPungvYHlY= user-ansible@ansible"
sudo mkdir /home/ansible
sudo mkdir /home/ansible/.ssh
sudo useradd -d /home/ansible -s /usr/bin/bash ansible
sudo chown ansible:ansible /home/ansible
sudo chown ansible:ansible /home/ansible/.ssh
sudo chmod 750 /home/ansible
echo "ansible ALL=(ALL:ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers.d/ansible
echo ${clefAnsible} ANSIBLE-AGENT | sudo tee -a /home/ansible/.ssh/authorized_keys
sudo chown ansible:ansible /home/ansible/.ssh/authorized_keys
sudo chmod 600 /home/ansible/.ssh/authorized_keys
sudo apt update
sudo apt install python3 -y
sudo reboot
