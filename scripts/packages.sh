#!/bin/bash

# Generates list of all installed packages
# Includes both packages from repos and aur

pacman -Qeq > installed_packages.txt
