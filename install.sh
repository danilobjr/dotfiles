#!/bin/bash

echo
echo "Updating apt packages"
echo

sudo apt update;

echo
echo "Installing Git"
echo

sudo apt install git;

echo
echo "Cloning dotfiles repo in /home directory"
echo

git clone https://github.com/danilobjr/dotfiles.git ZZZ;
