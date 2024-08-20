#!/bin/bash

ZERO="0"

cpucores=$(egrep -c '(vmx|svm)' /proc/cpuinfo)
echo You have $cpucores CPU cores.

if [[ $ZERO == $cpucores ]]; then
	echo "You don't have enough CPU cores for virtualization!"
	exit
else
	echo "You have enough CPU cores for virtualization!"
fi

sudo apt update -y
sudo apt install qemu qemu-kvm qemu-system-x86 virt-manager bridge-utils -y

sudo useradd -g $USER libvirt
sudo useradd -g $USER libvirt-kvm

sudo systemctl enable libvirtd.service
sudo systemctl start libvirtd.service