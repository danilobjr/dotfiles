#!/bin/bash

[[ $DOTFILES == "" ]] && DOTFILES=~/.dotfiles

# FUNCTIONS
# =========

# logging

function e_header() { echo -e "\n\033[1m$@\033[0m"; }
function e_success() { echo -e " \033[1;32m✔\033[0m  $@"; }
function e_error() { echo -e " \033[1;31m✖\033[0m  $@"; }
function e_arrow() { echo -e " \033[1;34m➜\033[0m  $@"; }

function initial_info() {
cat << EOF

.dotfiles - Danilo Barros
=========================
This script installs nice tools for programming on terminal.

First, run this command to install dotfiles CLI.
./install-dotfiles-cli.sh

Then, check how to use CLI commands.
dotfiles --help

Licensed under the MIT License.
danilobjr.mit-license.org
EOF
}

function show_help_info() {
cat << EOF

usage: dotfiles <command> [--help] [--all] [--tmux] [--zsh] [--vim]

Commands: 

    install     Install some tool based on a flag
    update      Syncs dotfiles with Github repo

Flags:

    help        Show commands and flags info
    source      Show repo url on Github
    all         Install all tools
    tmux        Install tmux
    zsh         Install zsh
    vim         Install vim

Example:

    dotfiles install --vim      Install vim on your machine

Info: 

    This tool will try to install git as well (if it's not)

EOF
}

function try_install_git() {
    # if Git is not installed, install it
    if [[ ! "$(type -P git)"  ]]; then
        e_header "Installing git"
        sudo apt-get -qq install git-core
    fi

    # if git is not installed by now, quit
    if [[ ! "$(type -P git)"  ]]; then
        e_error "Git should be installed. It isn't. Aborting."
        exit 1
    fi
}

# COMMANDS and FLAGS
# ==================

# empty command
if [[ "$1" == "" || ! -d $DOTFILES ]]; then 
    initial_info
exit;
fi

# --help flag
if [[ "$1" == "--help" ]]; then 
    show_help_info
fi

# --source flag
if [[ "$1" == "--source" ]]; then
    echo "https://github.com/danilobjr/dotfiles"
fi

# install command
if [[ "$1" == "install" ]]; then
    try_install_git
fi
