#!/bin/bash

# Create aliases
source /workspaces/.codespaces/.persistedshare/dotfiles/.kristenrc

# Define an array of commands to add to history
commands_to_add=(
    "dc logs -f --tail=100 ssr"
    "m dev_create_facilities_fixture_data"
    "docker system prune -a"
    "dc up -d"
    "m makemigrations"
    "git pull origin master --rebase --autostash"
    "cd /workspaces/web/src/frontend/rsdk && m generate_api_schemas && yarn run build:apiClient cd /workspaces/web"
)

# Add each command in the array to the history
for cmd in "${commands_to_add[@]}"; do
    echo "$cmd" >> ~/.bash_history
done

# Ensure history is updated immediately
shopt -s histappend     # Append to history, don't overwrite
PROMPT_COMMAND="history -a; history -n"  # Append and read history immediately

chmod +x /workspaces/.codespaces/.persistedshare/dotfiles/start.sh
/workspaces/.codespaces/.persistedshare/dotfiles/start.sh
