#!/bin/bash
newline=$'\n'

# Configure DNF
echo "fastestmirror=True${newline}max_parallel_downloads=10${newline}defaultyes=True${newline}keepcache=True${newline} | sudo tee /etc/dnf/dnf.conf

# Update System
sudo dnf update -y

# Install RPM Fusion
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf groupupdate core -y

# Install Multimedia Codecs
sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin --allowerasing
sudo dnf groupupdate sound-and-video -y
