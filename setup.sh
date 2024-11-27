#!/bin/bash

# Define an array of commands to add to history
commands_to_add=(
    "dc logs -f --tail=100 ssr"
    "m dev_create_facilities_fixture_data"
    "docker system prune -a"
    "dc up -d"
    "m makemigrations"
)

# Add each command in the array to the history
for cmd in "${commands_to_add[@]}"; do
    echo "$cmd" >> ~/.bash_history
done

# Ensure history is updated immediately
shopt -s histappend     # Append to history, don't overwrite
PROMPT_COMMAND="history -a; history -n"  # Append and read history immediately

# Add custom aliases
aliases_to_add=(
    "\n\n# kbasgall things"
    "alias dlog=\"dc logs -f --tail=100 ssr web\""
    "alias fdata=\"m dev_create_facilities_fixture_data\""
    "alias start="/workspaces/.codespaces/.persistedshare/dotfiles/start.sh""
    "alias prune="docker system prune -f && docker image prune -a""
)

for cmd in "${aliases_to_add[@]}"; do
    echo "$cmd" >> ~/.bashrc
done

source ~/.bashrc
chmod +x /workspaces/.codespaces/.persistedshare/dotfiles/start.sh
/workspaces/.codespaces/.persistedshare/dotfiles/start.sh
